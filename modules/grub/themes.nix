pkgs:
{
    futaba = pkgs.stdenv.mkDerivation {
        pname = "Futaba Grub Theme";
        version = "0.0.1";
        src = fetchTarball {
            url = "https://github.com/SiriusAhu/Persona_5_Royal_Grub_Themes/releases/download/v1.0/navi.tar.gz";
            sha256 = "sha256:0zd3yh04xg44vp4v7a03kv1p0nwlk2clkn1r0jimnd8sxxvqbalg";
        };

        installPhase = ''
            mkdir -p $out/theme
            cp -r ./* $out/theme/
        '';
    } + "/theme";

    yorha = pkgs.stdenv.mkDerivation {
        pname = "YoRHa Grub Theme";
        version = "0.0.1";
        src = fetchGit {
            url = "https://github.com/OliveThePuffin/yorha-grub-theme";
            rev = "4d9cd37baf56c4f5510cc4ff61be278f11077c81";
        };

        installPhase = ''
            mkdir -p $out/theme
            cp -r ./yorha-1920x1080/* $out/theme/
        '';
    } + "/theme";
}
