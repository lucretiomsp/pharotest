Class {
	#name : #MfMixingTableExamples,
	#superclass : #Object,
	#category : #'Mooflod-MixingTableWidget'
}

{ #category : #'as yet unclassified' }
MfMixingTableExamples class >> exampleSimpleMixingTable [

	<script>
	| t |
	t := MfMixingTableElement new
		     nbButtons: 10;
		     nbButtonPerRow: 5.
	t openMixingTable: t
]
