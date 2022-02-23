import Foundation

class CardModel {
    func getCards() -> [Card] {
        
        //Declare an array to store numbers we've already generated
        var generatedNumbersArray = [Int]()
        
        //Declare an array to store the generated cards
        var generatedCardsArray = [Card]()
        
        //Randomly generate pairs of cards
        while generatedNumbersArray.count < 8 {
            //Get a random number
            let randomNumber = arc4random_uniform(12) + 1
            
            //Ensure that the random number isn't one we already have
            if generatedNumbersArray.contains(Int(randomNumber)) == false{
                // Log the number
                print(randomNumber)
                
                //Store the number into the generatedNumbersArray
                generatedNumbersArray.append(Int(randomNumber))
                
                //Create the first card object
                var cardOne = Card()
                cardOne.imageName = "animal\(randomNumber)"
                generatedCardsArray.append(cardOne)
                
                //Create the second card object
                let cardTwo = Card()
                cardTwo.imageName = "animal\(randomNumber)"
                generatedCardsArray.append(cardTwo)
            }
        }
        
        //Randomize the array
        for i in 0...generatedCardsArray.count-1{
        
        //Find a random index to swap with
        let randomNumber = Int(arc4random_uniform(UInt32(generatedCardsArray.count)))
        
        //Swap the two cards
        let temporaryStorage = generatedCardsArray[i]
        generatedCardsArray[i] = generatedCardsArray[randomNumber]
        generatedCardsArray[randomNumber] = temporaryStorage
        }
        
        //Return the array
        return generatedCardsArray
    }
}
