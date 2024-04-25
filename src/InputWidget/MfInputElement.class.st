Class {
	#name : #MfInputElement,
	#superclass : #ToElement,
	#instVars : [
		'inputValue',
		'value',
		'minus',
		'plus'
	],
	#category : #InputWidget
}

{ #category : #'visual properties' }
MfInputElement >> backgroundPaint [ 
	"Set the background for the element to black"
	
	^ Color black
]

{ #category : #action }
MfInputElement >> decreaseInput [
	"Check if the value is not 0, then create a new updated value"

value > 0 ifTrue: [ 
	value:= value -1.
 ].
inputValue removeFromParent .
inputValue:= self initializeInputValue: value asString.


]

{ #category : #initialization }
MfInputElement >> defaultBorder [ 
	
^BlBorder paint: Color pink.
]

{ #category : #initialization }
MfInputElement >> defaultGeometry [ 

^BlRoundedRectangleGeometry cornerRadius: 20.
]

{ #category : #initialization }
MfInputElement >> defaultLayout [ 

^BlFrameLayout new.
]

{ #category : #action }
MfInputElement >> increaseInput [ 
	"create an updated value added to the input elem"
value := value + 1.
inputValue removeFromParent .
inputValue:= self initializeInputValue: value asString.

]

{ #category : #initialization }
MfInputElement >> initialize [ 

super initialize .
self geometry: self defaultGeometry.
self size: self inputExtent .
self background: self backgroundPaint .
self layout: self defaultLayout.
self border: self defaultBorder.
plus := self initializePlus.
minus :=self initializeMinus.
inputValue:= self initializeInputValue. 
value := inputValue text asString asNumber.
self initializeInputText .






]

{ #category : #initialization }
MfInputElement >> initializeInputText [
	"get the input text"
| inputtext |

inputtext := MfInputText new.
self addChild: inputtext.

^inputtext 
]

{ #category : #initialization }
MfInputElement >> initializeInputValue [
	"setting the default value to 20 and setting its attributes"
| ivalue|
ivalue := MfInputValue new.
ivalue  text: '20' asRopedText .
ivalue text attributes:  { (BlTextForegroundAttribute paint: Color white)}.
ivalue text fontSize: 30.
self addChild: ivalue.

^ivalue
]

{ #category : #initialization }
MfInputElement >> initializeInputValue: aValue [
	"update the value by creating a new one having the value aValue passed as parameter"
| ivalue|
ivalue := MfInputValue new.
ivalue  text: aValue asRopedText .
ivalue text attributes:  { (BlTextForegroundAttribute paint: Color white)}.
ivalue text fontSize: 30.
self addChild: ivalue.

^ivalue
]

{ #category : #initialization }
MfInputElement >> initializeMinus [

| circle |

circle := BlElement new 
	background: Color black;
	border: (BlBorder paint: Color pink width: 2) ;
	layout: BlFrameLayout new;
	geometry: BlCircle new.
circle constraintsDo: [ :c |
	c frame horizontal alignLeft .
	c frame vertical alignCenter ].
circle transformDo: [ :t |
	t translateBy: 15@0].

minus := BlTextElement new
	text: ('-' asRopedText attributes:  { (BlTextForegroundAttribute paint: Color white)}).
minus text fontSize: 80.
minus constraintsDo: [ :c |
          c frame horizontal alignCenter.
          c frame vertical alignCenter ].
circle addEventHandlerOn: BlMouseDownEvent   do: [ :e | 
			self decreaseInput .
			 ].
		
circle addChild: minus.
self addChild: circle.

^circle


]

{ #category : #initialization }
MfInputElement >> initializePlus [
	| circle |
	
circle := BlElement new 
	background: Color black;
	border: (BlBorder paint: Color pink width: 2) ;
	layout: BlFrameLayout new;
	geometry: BlCircle new.
circle constraintsDo: [ :c |
	c frame horizontal alignRight .
	c frame vertical alignCenter ].
circle transformDo: [ :t |
	t translateBy: (-15)@0].

plus := BlTextElement new
	text: ('+' asRopedText attributes:  { (BlTextForegroundAttribute paint: Color white)}).
plus text fontSize: 55.
plus constraintsDo: [ :c |
	c frame horizontal alignCenter .
	c frame vertical alignCenter ].
circle addEventHandlerOn: BlMouseDownEvent   do: [ :e | 
			self increaseInput .
			 ].
circle addChild: plus.
self addChild: circle.

^ circle.
   
]

{ #category : #'visual properties' }
MfInputElement >> inputExtent [
	"set the size of input element"
	^ 300@120
]

{ #category : #skin }
MfInputElement >> installRawStyle [ 
	"Override method to define skin"
	super installRawStyle.
	


]

{ #category : #accessing }
MfInputElement >> minus [ 

^minus.
]

{ #category : #'instance creation' }
MfInputElement >> newRawSkin [ 
	"Allow to create an instance of the widget skin"
^MfInputElementSkin new.
]

{ #category : #action }
MfInputElement >> openInput: anInput [
	"sets configuration to display the input element in a space"
	| space |
	space := BlSpace new.
	anInput defaultSkin: MfInputElementSkin new.
	space root
		layout: BlFlowLayout horizontal.
	anInput transformDo: [ :c |
		c translateBy: 200@200
		 ].
	space root addChild: anInput  .
	space toTheme: MfInputElementTheme new .
	space show.
	^ anInput 


]

{ #category : #'special characters' }
MfInputElement >> plus [
^plus.
]

{ #category : #evaluating }
MfInputElement >> value [ 

^ value.
]
