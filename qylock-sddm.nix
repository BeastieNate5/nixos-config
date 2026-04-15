{ 
  stdenv,
  theme ? "nier-automata",
  rodinFont ? null
}:
stdenv.mkDerivation {
    pname = "qlock";
    version = "0.0.1";

    src = fetchGit {
        url = "https://github.com/Darkkal44/qylock.git";
        rev = "a45a5ec4a66e42a86b83fac7d00159b598851f58";
    };

    installPhase = ''
        mkdir -p $out/share/sddm/themes/
        cp -r ./themes/${theme} $out/share/sddm/themes
        cp -r ./Assets $out/share/sddm/themes/${theme}

        ${if theme == "nier-automata" then ''
          if [ -n "${toString rodinFont}" ]; then
            cp "${rodinFont}" $out/share/sddm/themes/${theme}/font/
          fi
        '' else ""}

    '';
}

