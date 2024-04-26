Class {
	#name : #MfInputTextElement,
	#superclass : #BlTextElement,
	#category : #InputWidget
}

{ #category : #initialization }
MfInputTextElement >> initialize [ 

super initialize .
self text: ('Input' asRopedText attributes:  { (BlTextForegroundAttribute paint: Color white)}).
self text fontSize: 25.
self constraintsDo: [ :c |
	c frame horizontal alignCenter ].
self transformDo: [ :t |
	t translateBy: 0@10].
]

{ #category : #accessing }
MfInputTextElement >> text [ 
	"get the text of the input"

^text
]

{ #category : #accessing }
MfInputTextElement >> text: aText [
	"allow to set the text as aText"
text:= aText .
]
