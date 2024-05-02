Class {
	#name : #MfMixingTableElement,
	#superclass : #ToElement,
	#classVars : [
		'nbButtons',
		'nbRows'
	],
	#category : #MooflodMixingTableWidget
}

{ #category : #initialization }
MfMixingTableElement >> defaultGeometry [
^ BlRectangleGeometry new
	
]

{ #category : #'as yet unclassified' }
MfMixingTableElement >> initButtons [

	| button |
	1 to: nbButtons do: [ :b |
		button := MfMixingButtonElement new.
		self addChild: button ].
	self childrenDo: [ :child |
		child
			addEventHandlerOn: BlMouseDownEvent
			do: [ :c | child background: Color random ] ]
]

{ #category : #initialization }
MfMixingTableElement >> initialize [

	super initialize.
	self geometry: self defaultGeometry.
	self size: self tableExtent.
	self background: Color black.
	self border: (BlBorder paint: Color blue width: 2).
	self layout: (BlGridLayout horizontal cellSpacing: 20).
	self constraintsDo: [ :aLayoutConstraints |
		aLayoutConstraints horizontal fitContent.
		aLayoutConstraints vertical fitContent ]
]

{ #category : #'as yet unclassified' }
MfMixingTableElement >> nbButtons [

^nbButtons 
]

{ #category : #'as yet unclassified' }
MfMixingTableElement >> nbButtons: buttons [

	nbButtons := buttons.
	self initButtons.
]

{ #category : #'as yet unclassified' }
MfMixingTableElement >> nbRows [

^nbRows
]

{ #category : #'as yet unclassified' }
MfMixingTableElement >> nbRows: rows [

	nbRows := rows.
		self layout columnCount: nbRows.
]

{ #category : #'as yet unclassified' }
MfMixingTableElement >> openMixingTable: aTable [

	| space |
	space := BlSpace new.
	space root layout: BlFlowLayout horizontal.
	aTable transformDo: [ :c | c translateBy: 180 @ 150 ].
	space root addChild: aTable.
	space toTheme: MfMixingTableTheme new.
	space applyAllSkinInstallers.
	space show.
	^ aTable
]

{ #category : #'as yet unclassified' }
MfMixingTableElement >> tableExtent [

	^ 400 @ 200
]
