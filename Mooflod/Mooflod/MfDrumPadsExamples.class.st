Class {
	#name : #MfDrumPadsExamples,
	#superclass : #Object,
	#category : #'Mooflod-DrumPadWidget'
}

{ #category : #'as yet unclassified' }
MfDrumPadsExamples class >> exampleSimpleMixingTable [

	<script>
	| t |
	t := MfDrumPadsElement new
		     nbButtons: 10;
		     nbButtonPerRow: 5.
	t openMixingTable: t
]
