{ ... }:
{
    boot.loader.efi.canTouchEfiVariables = true;
    boot.loader.grub.enable = true;
    boot.loader.grub.device = "nodev";
    boot.loader.grub.efiSupport = true;
    /*
    boot.loader.grub.theme = pkgs.stdenv.mkDerivation {
        pname = "Futaba Grub Theme";
        version = "0.0.1";
        src = fetchTarball {
            url = "https://github.com/SiriusAhu/Persona_5_Royal_Grub_Themes/releases/download/v1.0/navi.tar.gz";
            sha256 = "sha256:0zd3yh04xg44vp4v7a03kv1p0nwlk2clkn1r0jimnd8sxxvqbalg";
        };

        installPhase = ''
            mkdir -p $out/navi
            cp -r ./* $out/navi/
        '';
    } + "/navi/theme.txt";
    */
}
