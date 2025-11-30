{config, pks, ...}:

{
    imports = [
        ./modules/bootloader.nix
    	./modules/users.nix
        ./modules/fonts.nix
        ./modules/services.nix
    ];
}
