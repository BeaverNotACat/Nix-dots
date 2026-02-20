{ pkgs, ... }:
let
  # https://github.com/jhovold/linux/wiki/X13s#audio
  stable-alsa-ucm-conf = pkgs.alsa-ucm-conf.overrideAttrs (_: {
    version = "1.2.13";
    src = pkgs.fetchurl {
      url = "mirror://alsa/lib/alsa-ucm-conf-1.2.13.tar.bz2";
      hash = "sha256-RIO245g8ygj9Mmpz+65Em1A25ET7GgfA3udLUEt6ta8=";
    };

    installPhase = ''
      runHook preInstall

      substituteInPlace ucm2/lib/card-init.conf \
        --replace-fail "/bin/rm" "${pkgs.coreutils}/bin/rm" \
        --replace-fail "/bin/mkdir" "${pkgs.coreutils}/bin/mkdir"

      files=(
        "ucm2/HDA/HDA.conf"
        "ucm2/codecs/rt715/init.conf"
        "ucm2/codecs/rt715-sdca/init.conf"
        "ucm2/Intel/cht-bsw-rt5672/cht-bsw-rt5672.conf"
        "ucm2/Intel/bytcr-rt5640/bytcr-rt5640.conf"
      )

      for file in "''${files[@]}"; do
        if [ -f "$file" ]; then
          substituteInPlace "$file" \
            --replace-fail '/sbin/modprobe' '${pkgs.kmod}/bin/modprobe'
        fi
      done

      mkdir -p $out/share/alsa
      cp -r ucm ucm2 $out/share/alsa

      runHook postInstall
    '';
  });
in
{
  environment.sessionVariables = {
    ALSA_CONFIG_UCM2 = "${stable-alsa-ucm-conf}/share/alsa/ucm2";
  };
}
