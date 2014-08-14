# This file was auto-generated by cabal2nix. Please do NOT edit manually!

{ cabal, parsers, QuickCheck, testFramework
, testFrameworkQuickcheck2, text, textLatin1, textPrinter, typeHint
}:

cabal.mkDerivation (self: {
  pname = "data-textual";
  version = "0.3.0.2";
  sha256 = "0c4qs923dj4jnvvkjvbij0c1yg922iw66140cq6wb1m4h6q31ia4";
  buildDepends = [ parsers text textLatin1 textPrinter ];
  testDepends = [
    parsers QuickCheck testFramework testFrameworkQuickcheck2
    textPrinter typeHint
  ];
  meta = {
    homepage = "https://github.com/mvv/data-textual";
    description = "Human-friendly textual representations";
    license = self.stdenv.lib.licenses.bsd3;
    platforms = self.ghc.meta.platforms;
  };
})
