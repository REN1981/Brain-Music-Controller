/*
  ==============================================================================

  This is an automatically generated GUI class created by the Introjucer!

  Be careful when adding custom code to these files, as only the code within
  the "//[xyz]" and "//[/xyz]" sections will be retained when the file is loaded
  and re-saved.

  Created with Introjucer version: 4.1.0

  ------------------------------------------------------------------------------

  The Introjucer is part of the JUCE library - "Jules' Utility Class Extensions"
  Copyright (c) 2015 - ROLI Ltd.

  ==============================================================================
*/

//[Headers] You can add your own extra header files here...
#include "MainComponent.h"
//[/Headers]

#include "GUIComponent.h"


//[MiscUserDefs] You can add your own user definitions and misc code here...
//[/MiscUserDefs]

//==============================================================================
GUIComponent::GUIComponent ()
{
    //[Constructor_pre] You can add your own custom stuff here..
    //[/Constructor_pre]

    addAndMakeVisible (upButton = new TextButton ("Up Button"));
    upButton->setButtonText (TRANS("Up"));
    upButton->addListener (this);

    addAndMakeVisible (downButton = new TextButton ("Down Button"));
    downButton->setButtonText (TRANS("Down"));
    downButton->addListener (this);

    addAndMakeVisible (leftButton = new TextButton ("Left Button"));
    leftButton->setButtonText (TRANS("Left"));
    leftButton->addListener (this);

    addAndMakeVisible (rightButton = new TextButton ("Right Button"));
    rightButton->setButtonText (TRANS("Right"));
    rightButton->addListener (this);

    addAndMakeVisible (nextButton = new TextButton ("Next Button"));
    nextButton->setButtonText (TRANS("Next"));
    nextButton->addListener (this);

    addAndMakeVisible (prevButton = new TextButton ("Prev Button"));
    prevButton->setButtonText (TRANS("Prev"));
    prevButton->addListener (this);

    addAndMakeVisible (volSlider = new Slider ("Volume Slider"));
    volSlider->setRange (0, 1, 0);
    volSlider->setSliderStyle (Slider::LinearVertical);
    volSlider->setTextBoxStyle (Slider::TextBoxBelow, false, 80, 20);
    volSlider->addListener (this);

    addAndMakeVisible (comboBox = new ComboBox ("new combo box"));
    comboBox->setEditableText (false);
    comboBox->setJustificationType (Justification::centredLeft);
    comboBox->setTextWhenNothingSelected (TRANS("select object to create"));
    comboBox->setTextWhenNoChoicesAvailable (TRANS("(no choices)"));
    comboBox->addItem (TRANS("object1"), 1);
    comboBox->addItem (TRANS("ojbect2"), 2);
    comboBox->addItem (TRANS("object3"), 3);
    comboBox->addListener (this);

    addAndMakeVisible (label = new Label ("new label",
                                          TRANS("label text")));
    label->setFont (Font (15.00f, Font::plain));
    label->setJustificationType (Justification::centred);
    label->setEditable (false, false, false);
    label->setColour (TextEditor::textColourId, Colours::black);
    label->setColour (TextEditor::backgroundColourId, Colour (0x00000000));


    //[UserPreSize]
    //[/UserPreSize]

    setSize (800, 600);


    //[Constructor] You can add your own custom stuff here..
    //[/Constructor]
}

GUIComponent::~GUIComponent()
{
    //[Destructor_pre]. You can add your own custom destruction code here..
    //[/Destructor_pre]

    upButton = nullptr;
    downButton = nullptr;
    leftButton = nullptr;
    rightButton = nullptr;
    nextButton = nullptr;
    prevButton = nullptr;
    volSlider = nullptr;
    comboBox = nullptr;
    label = nullptr;


    //[Destructor]. You can add your own custom destruction code here..
    //[/Destructor]
}

//==============================================================================
void GUIComponent::paint (Graphics& g)
{
    //[UserPrePaint] Add your own custom painting code here..
    //[/UserPrePaint]

    g.fillAll (Colours::white);

    g.setColour (Colours::black);
    g.setFont (Font ("Baoli SC", 56.50f, Font::plain));
    g.drawText (TRANS("Brain Controller"),
                19, 19, 325, 45,
                Justification::centred, true);

    //[UserPaint] Add your own custom painting code here..
    //[/UserPaint]
}

void GUIComponent::resized()
{
    //[UserPreResize] Add your own custom resize code here..
    //[/UserPreResize]

    upButton->setBounds (344, 104, 80, 79);
    downButton->setBounds (344, 445, 80, 79);
    leftButton->setBounds (136, 269, 80, 79);
    rightButton->setBounds (544, 269, 80, 79);
    nextButton->setBounds (624, 560, 150, 24);
    prevButton->setBounds (464, 560, 150, 24);
    volSlider->setBounds (16, 456, 40, 128);
    comboBox->setBounds (616, 40, 150, 24);
    label->setBounds (264, 240, 240, 160);
    //[UserResized] Add your own custom resize handling here..
    //[/UserResized]
}

void GUIComponent::buttonClicked (Button* buttonThatWasClicked)
{
    //[UserbuttonClicked_Pre]
    String  s;
    //[/UserbuttonClicked_Pre]

    if (buttonThatWasClicked == upButton)
    {
        //[UserButtonCode_upButton] -- add your button handler code here..
        s = "Up";
        //[/UserButtonCode_upButton]
    }
    else if (buttonThatWasClicked == downButton)
    {
        //[UserButtonCode_downButton] -- add your button handler code here..
        s = "Down";
        //[/UserButtonCode_downButton]
    }
    else if (buttonThatWasClicked == leftButton)
    {
        //[UserButtonCode_leftButton] -- add your button handler code here..
        s = "Left";
        //[/UserButtonCode_leftButton]
    }
    else if (buttonThatWasClicked == rightButton)
    {
        //[UserButtonCode_rightButton] -- add your button handler code here..
        s = "Right";
        //[/UserButtonCode_rightButton]
    }
    else if (buttonThatWasClicked == nextButton)
    {
        //[UserButtonCode_nextButton] -- add your button handler code here..
        s = "Next";
        //[/UserButtonCode_nextButton]
    }
    else if (buttonThatWasClicked == prevButton)
    {
        //[UserButtonCode_prevButton] -- add your button handler code here..
        s = "Prev";
        //[/UserButtonCode_prevButton]
    }

    //[UserbuttonClicked_Post]
    label->setText("You Have Clicked: " + s, dontSendNotification);
    //[/UserbuttonClicked_Post]
}

void GUIComponent::sliderValueChanged (Slider* sliderThatWasMoved)
{
    //[UsersliderValueChanged_Pre]
    //[/UsersliderValueChanged_Pre]

    if (sliderThatWasMoved == volSlider)
    {
        //[UserSliderCode_volSlider] -- add your slider handling code here..
//        MainContentComponent.setVolume(volSlider->getValue());
        //[/UserSliderCode_volSlider]
    }

    //[UsersliderValueChanged_Post]
    //[/UsersliderValueChanged_Post]
}

void GUIComponent::comboBoxChanged (ComboBox* comboBoxThatHasChanged)
{
    //[UsercomboBoxChanged_Pre]
    //[/UsercomboBoxChanged_Pre]

    if (comboBoxThatHasChanged == comboBox)
    {
        //[UserComboBoxCode_comboBox] -- add your combo box handling code here..
        //[/UserComboBoxCode_comboBox]
    }

    //[UsercomboBoxChanged_Post]
    //[/UsercomboBoxChanged_Post]
}



//[MiscUserCode] You can add your own definitions of your custom methods or any other code here...
//[/MiscUserCode]


//==============================================================================
#if 0
/*  -- Introjucer information section --

    This is where the Introjucer stores the metadata that describe this GUI layout, so
    make changes in here at your peril!

BEGIN_JUCER_METADATA

<JUCER_COMPONENT documentType="Component" className="GUIComponent" componentName=""
                 parentClasses="public Component" constructorParams="" variableInitialisers=""
                 snapPixels="8" snapActive="1" snapShown="1" overlayOpacity="0.330"
                 fixedSize="1" initialWidth="800" initialHeight="600">
  <BACKGROUND backgroundColour="ffffffff">
    <TEXT pos="19 19 325 45" fill="solid: ff000000" hasStroke="0" text="Brain Controller"
          fontname="Baoli SC" fontsize="56.5" bold="0" italic="0" justification="36"/>
  </BACKGROUND>
  <TEXTBUTTON name="Up Button" id="91e17258eaca6577" memberName="upButton"
              virtualName="" explicitFocusOrder="0" pos="344 104 80 79" buttonText="Up"
              connectedEdges="0" needsCallback="1" radioGroupId="0"/>
  <TEXTBUTTON name="Down Button" id="34cf44f10aecf903" memberName="downButton"
              virtualName="" explicitFocusOrder="0" pos="344 445 80 79" buttonText="Down"
              connectedEdges="0" needsCallback="1" radioGroupId="0"/>
  <TEXTBUTTON name="Left Button" id="8d393c429035c100" memberName="leftButton"
              virtualName="" explicitFocusOrder="0" pos="136 269 80 79" buttonText="Left"
              connectedEdges="0" needsCallback="1" radioGroupId="0"/>
  <TEXTBUTTON name="Right Button" id="cef10496e31be52" memberName="rightButton"
              virtualName="" explicitFocusOrder="0" pos="544 269 80 79" buttonText="Right"
              connectedEdges="0" needsCallback="1" radioGroupId="0"/>
  <TEXTBUTTON name="Next Button" id="d92d0e19f6c9b317" memberName="nextButton"
              virtualName="" explicitFocusOrder="0" pos="624 560 150 24" buttonText="Next"
              connectedEdges="0" needsCallback="1" radioGroupId="0"/>
  <TEXTBUTTON name="Prev Button" id="21cf5fce1129acec" memberName="prevButton"
              virtualName="" explicitFocusOrder="0" pos="464 560 150 24" buttonText="Prev"
              connectedEdges="0" needsCallback="1" radioGroupId="0"/>
  <SLIDER name="Volume Slider" id="2176ca2ae551b340" memberName="volSlider"
          virtualName="" explicitFocusOrder="0" pos="16 456 40 128" min="0"
          max="1" int="0" style="LinearVertical" textBoxPos="TextBoxBelow"
          textBoxEditable="1" textBoxWidth="80" textBoxHeight="20" skewFactor="1"/>
  <COMBOBOX name="new combo box" id="164d8e784b1be438" memberName="comboBox"
            virtualName="" explicitFocusOrder="0" pos="616 40 150 24" editable="0"
            layout="33" items="object1&#10;ojbect2&#10;object3" textWhenNonSelected="select object to create"
            textWhenNoItems="(no choices)"/>
  <LABEL name="new label" id="89e45d32e8c85b8e" memberName="label" virtualName=""
         explicitFocusOrder="0" pos="264 240 240 160" edTextCol="ff000000"
         edBkgCol="0" labelText="label text" editableSingleClick="0" editableDoubleClick="0"
         focusDiscardsChanges="0" fontname="Default font" fontsize="15"
         bold="0" italic="0" justification="36"/>
</JUCER_COMPONENT>

END_JUCER_METADATA
*/
#endif


//[EndFile] You can add extra defines here...
//[/EndFile]
