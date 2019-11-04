module Test.Generated.Main2285855596 exposing (main)

import Example
import RippleCarryAdderTests

import Test.Reporter.Reporter exposing (Report(..))
import Console.Text exposing (UseColor(..))
import Test.Runner.Node
import Test

main : Test.Runner.Node.TestProgram
main =
    [     Test.describe "Example" [Example.guardianNames,
    Example.comparisonTests,
    Example.additionTests],     Test.describe "RippleCarryAdderTests" [RippleCarryAdderTests.orGateTests,
    RippleCarryAdderTests.inverterTests,
    RippleCarryAdderTests.halfAdderTests,
    RippleCarryAdderTests.fullAdderTests,
    RippleCarryAdderTests.andGateTests] ]
        |> Test.concat
        |> Test.Runner.Node.run { runs = Nothing, report = (ConsoleReport UseColor), seed = 129429709395595, processes = 4, paths = ["/c/dev/elmsandbox/tests/RippleCarryAdderTests.elm"]}