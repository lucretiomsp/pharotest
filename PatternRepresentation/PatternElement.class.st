Class {
	#name : #PatternElement,
	#superclass : #BlElement,
	#instVars : [
		'pattern'
	],
	#category : #PatternRepresentation
}

{ #category : #adding }
PatternElement >> addBarToThePattern [ 

	
]

{ #category : #'visual properties' }
PatternElement >> backgroundPaint [ 
	
	^ Color red
]

{ #category : #initialization }
PatternElement >> initialize [ 

	super initialize.
	self size: self patternExtent .
	self background: self backgroundPaint .
	self geometry: BlRectangle new.
	self layout: BlFrameLayout new.
]

{ #category : #'visual properties' }
PatternElement >> patternExtent [

	^ 526@60
]
