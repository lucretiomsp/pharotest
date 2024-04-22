Class {
	#name : #MfInputValue,
	#superclass : #BlTextElement,
	#category : #InputWidget
}

{ #category : #initialization }
MfInputValue >> initialize [ 

super initialize .
self text: ('20' asRopedText attributes:  { (BlTextForegroundAttribute paint: Color white)}).
self text fontSize: 30.
self constraintsDo: [ :c |
	c frame horizontal alignCenter.
	c frame vertical alignCenter  ].

]
