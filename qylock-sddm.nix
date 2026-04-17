{
  stdenv,
  theme ? "nier-automata",
  nierFont ? null,
  terrariaFont ? null,
  genshinFont ? null,
  swordFont ? null,
  minecraftFont ? null,
  hsrFont ? null,
  osuFont ? null,
}:
let
  mkInstallFontCmds =
    { font, theme }:
    ''
      if [ -n "${toString font}" ]; then
        mkdir -p $out/share/sddm/themes/${theme}/font/
        cp "${font}" $out/share/sddm/themes/${theme}/font/
      fi
    '';
in
stdenv.mkDerivation {
  pname = "qlock";
  version = "0.0.1";

  src = fetchGit {
    url = "https://github.com/Darkkal44/qylock.git";
    rev = "a45a5ec4a66e42a86b83fac7d00159b598851f58";
  };

  installPhase = ''
    mkdir -p $out/share/sddm/themes/
    mkdir -p $out/share/quickshell/qylock

    cp -r ./themes/${theme} $out/share/sddm/themes
    cp -r ./Assets $out/share/sddm/themes/${theme}

    cp -r ./quickshell-lockscreen/* $out/share/quickshell/qylock

    ${
      if theme == "nier-automata" then
        mkInstallFontCmds {
          font = nierFont;
          theme = theme;
        }
      else if theme == "terraria" then
        mkInstallFontCmds {
          font = terrariaFont;
          theme = theme;
        }
      else if theme == "Genshin" then
        mkInstallFontCmds {
          font = genshinFont;
          theme = theme;
        }
      else if theme == "sword" then
        mkInstallFontCmds {
          font = swordFont;
          theme = theme;
        }
      else if theme == "minecraft" then
        mkInstallFontCmds {
          font = minecraftFont;
          theme = theme;
        }
      else if theme == "star-rail" then
        mkInstallFontCmds {
          font = hsrFont;
          theme = theme;
        }
      else if theme == "osu" then
        mkInstallFontCmds {
          font = osuFont;
          theme = theme;
        }
      else
        ""
    }

  '';
}
