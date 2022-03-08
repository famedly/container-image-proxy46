{ pkgs ? import <nixpkgs> { }
, pkgsLinux ? import <nixpkgs> { config = import ./config.nix; system = "x86_64-linux"; }
}:

pkgs.dockerTools.buildImage {
  name = "proxy46";
  config = {
    Cmd = [ "${pkgsLinux.nginx}/bin/nginx" "-g" "daemon off;" "-c" "/etc/nginx/nginx.conf" ];
  };
  contents = [ pkgs.dockerTools.fakeNss ];
}
