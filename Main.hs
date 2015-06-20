import Test.Hspec
import Data.List
import Data.Maybe

type Coin = Int 
type Sum = Int
type Coins = [Coin]


-- approche dynamique :                  
-- si le head est > a la sum, on passe au suivant, fail si pas de suivant
-- on generalise > vers pas de succes (somme inatteignable)
-- cette approche me parait difficile, trop peu expressive


-- approche constructive    
-- je filtre les pieces >
-- j'enumere tous les subsets possibles, ordonnes selon mes preferences
-- je filtre ceux sommant a s
-- je prends le premier

subsets :: Coins -> [Coins]
subsets = foldl (\s e -> s ++ map (++ [e]) s)  [[]]

changeFor :: Coins -> Sum -> Maybe Coins
changeFor cs s = listToMaybe solutions
                 where solutions  = filter (\se -> sum se == s) candidates
                       candidates = subsets (filter (<= s) cs)
                 
main = hspec spec

spec :: Spec
spec = do
    describe "subsets" $ do
      it "should work" $ do
          subsets [2,1]   `shouldBe` [[],[2],[1],[2,1]]
    describe "change" $ do
      it "should work" $ do
          [2,1] `changeFor` 3  `shouldBe` Just [2,1]
          [4,3,3,1,1] `changeFor` 6  `shouldBe` Just [3,3]
          [4,3] `changeFor` 5  `shouldBe` Nothing
