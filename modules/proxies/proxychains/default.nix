{
  programs.proxychains = {
    enable = true;
    proxyDNS = true;

    proxies.shadowsocks = {
      enable = true;
      type = "socks5";
      host = "127.0.0.1";
      port = 1080;
    };
  };
}
