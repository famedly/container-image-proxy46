{
  packageOverrides = pkgs: {
    nginx = pkgs.nginx.overrideAttrs (oldAttrs: rec {
      patches = (oldAttrs.patches or []) ++ [
        ./patches/cap_net_bind_service.patch
        ./patches/proxy_reuseaddr.patch
        ./patches/resolver_options.patch
      ];
    });
  };
}
