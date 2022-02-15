//
//  wordCheck.swift
//  Gunslinger Hangman
//
//  Created by Sam Zdziarski on 2/10/22.
//
import Foundation
//this is the building blocks of the game.

extension StringProtocol {
    subscript(offset: Int) -> Character {
        self[index(startIndex, offsetBy: offset)]
    }
}
//This function lets me replace words at indexes within a swift string
func replace(word: String, index: Int, newChar: Character) -> String {
    var chars = Array(word)
    chars[index] = newChar
    let modifiedString = String(chars)
    return modifiedString
}
//this takes the guessWord (users progress on the word) and repalces it with any instances that where the chosen letter is locates
func replaceLetters(letter: String, word: String, wordGuess: String) -> String {
    var modifiedString = ""
    var outputString = ""
    //adds the first character from the generated word (from API) to modifed string
    modifiedString.append(wordGuess[0])
    //this loop takes every other letter and adds it to the modified string (every other letter to not include spaces
    for i in 1...wordGuess.count - 1 {
        if i % 2 == 0 {
            modifiedString.append(wordGuess[i])
        }
    }
    //this replaces any instance of letter x if it occurs in the generates string
    for i in 0...word.count - 1 {
        if word[i] == letter[0] {
            modifiedString = replace(word: modifiedString, index: i, newChar: letter[0])
        }
    }
    // this reformats the newly modified string to fit guessWord styling
    for i in 0...modifiedString.count - 1{
        outputString.append(modifiedString[i])
        outputString.append(" ")
    }
    
    return outputString
}
//creates a presentation string whcih can be used at the start of a new game when a new word is generated
func makePresentationString(word: String) -> String {
    var output = ""
    for _ in 0...word.count - 1 {
        output.append("_ ")
    }
    return output;
}
