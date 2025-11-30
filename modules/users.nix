{pkgs, ...}:
{
   users.users.nate = {
     isNormalUser = true;
     shell = pkgs.zsh;
     extraGroups = [ "wheel" ];
     packages = with pkgs; [
       tree
     ];
  };
}
