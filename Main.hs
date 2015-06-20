import Test.Hspec
import Data.List

type Coin = Int 
type Sum = Int
type Coins = [Coin]


-- approche dynamique :                  
-- si le head est > a la sum, on passe au suivant, fail si pas de suivant
-- on generalise > vers pas de succes (somme inatteignable)
-- cette approche me parait trop peu expressive


-- approche constructive    
-- je filtre les pieces >
-- j'enumere tous les subsets possibles, ordonnes selon mes preferences
-- je filtre ceux sommant a s
-- je prend le premier


subsets :: Coins -> [Coins]
subsets = undefined                           
                 
main = hspec spec

spec :: Spec
spec = do
    describe "subsets" $ do
      it "should work" $ do
          subsets [2,1]   `shouldBe` [[],[2],[1],[2,1]]

