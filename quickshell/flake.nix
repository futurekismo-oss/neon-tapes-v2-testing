{
  description = "A basic flake with a shell";
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  inputs.systems.url = "github:nix-systems/default";
  inputs.flake-utils = {
    url = "github:numtide/flake-utils";
    inputs.systems.follows = "systems";
  };

  outputs =
    { nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in
      {
        devShells.default = pkgs.mkShell {
          packages = with pkgs; [
            kdePackages.qtdeclarative
            papirus-icon-theme
            hicolor-icon-theme
            kdePackages.kimageformats
          ];

          shellHook = ''
            export QML2_IMPORT_PATH="${pkgs.kdePackages.qtdeclarative}/lib/qt-6/qml:${pkgs.quickshell}/lib/qt-6/qml:$QML2_IMPORT_PATH"
            export QML_IMPORT_PATH="$QML2_IMPORT_PATH"
            export QS_NO_RELOAD_POPUP=1
            export DATA_DIRS=$XDG_DATA_DIRS:/run/current-system/sw/share
            export QS_ICON_THEME=Papirus
          '';
        };
      }
    );
}
