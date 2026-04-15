{
  inputs = {
    utils.url = "github:numtide/flake-utils";
  };
  outputs =
    {
      self,
      nixpkgs,
      utils,
    }:
    utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in
      {
        devShell = pkgs.mkShell {
          buildInputs = with pkgs; [
            # lua-language-server
            # luarocks
          ];
          # LUA = "${pkgs.lua}";
          shellHook = ''
            # luarocks config variables.LUA_INCDIR ${pkgs.lua5}/include
          '';
        };
      }
    );
}
