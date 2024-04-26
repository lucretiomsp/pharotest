Class {
	#name : #MfTimerElement,
	#superclass : #ToElement,
	#category : #TimerWidget
}

{ #category : #initialization }
MfTimerElement >> defaultBorder [ 

^ BlBorder paint: Color black.
]

{ #category : #initialization }
MfTimerElement >> defaultGeometry [ 	

^BlCircleGeometry new matchExtent: self extent
]

{ #category : #'as yet unclassified' }
MfTimerElement >> initialize [

super initialize .
self geometry: self defaultGeometry .
self border: self defaultBorder.
self size: 300@300.
self background: Color black.
]

{ #category : #'as yet unclassified' }
MfTimerElement >> openTimer: aTimer [
	| space |
	
space:= BlSpace new.
aTimer defaultSkin: MfTimerElementSkin new.
space root
		layout: BlFlowLayout horizontal.
	aTimer transformDo: [ :c |
		c translateBy: 200@150
		 ].
	space root addChild: aTimer .
	space toTheme: MfTimerElementTheme new .
	space applyAllSkinInstallers .
	space show.
	^ aTimer .





]
