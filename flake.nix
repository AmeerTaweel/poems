{
	description = "Poems";
	inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
	inputs.flake-utils.url = "github:numtide/flake-utils";

	outputs = { self, nixpkgs, flake-utils }:
	flake-utils.lib.eachDefaultSystem (system: let
		pkgs = nixpkgs.legacyPackages.${system};
		tex-env = pkgs.texlive.combine {
			inherit (pkgs.texlive) scheme-full latex-bin latexmk;
		};
	in {
		devShell = pkgs.mkShell {
			nativeBuildInputs = with pkgs; [
				# LaTeX Documents
				tex-env
			];
		};
		buildInputs = [ ];
	});
}
