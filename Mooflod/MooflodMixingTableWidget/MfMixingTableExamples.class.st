Class {
	#name : #MfMixingTableExamples,
	#superclass : #Object,
	#category : #MooflodMixingTableWidget
}

{ #category : #'as yet unclassified' }
MfMixingTableExamples class >> exampleSimpleMixingTable [

	<script>
	| t |
	t := MfMixingTableElement new
		     nbButtons: 20;
		     nbRows: 5.
	t openMixingTable: t
]
