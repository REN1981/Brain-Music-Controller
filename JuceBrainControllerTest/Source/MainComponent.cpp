/*
  ==============================================================================

    MainComponent.cpp
    Created: 14 Apr 2016 7:05:41am
    Author:  JuanS

  ==============================================================================
*/

#include "../JuceLibraryCode/JuceHeader.h"
#include "MainComponent.h"
#include "GUIComponent.h"

//==============================================================================
MainContentComponent::MainContentComponent()
{
    setSize (800, 600);

    // specify the number of input and output channels that we want to open
    setAudioChannels (2, 2);
    addAndMakeVisible(editor);
}

MainContentComponent::~MainContentComponent()
{
    shutdownAudio();
}

//=======================================================================
void MainContentComponent::prepareToPlay (int samplesPerBlockExpected, double sampleRate)
{
    // This function will be called when the audio device is started, or when
    // its settings (i.e. sample rate, block size, etc) are changed.

    // You can use this function to initialise any resources you might need,
    // but be careful - it will be called on the audio thread, not the GUI thread.

    // For more details, see the help for AudioProcessor::prepareToPlay()
}

void MainContentComponent::getNextAudioBlock (const AudioSourceChannelInfo& bufferToFill)
{
    // Your audio-processing code goes here!

    // For more details, see the help for AudioProcessor::getNextAudioBlock()

    // Right now we are not producing any data, in which case we need to clear the buffer
    // (to prevent the output of random noise)
//    bufferToFill.clearActiveBufferRegion();
    
    for (int channel = 0; channel < bufferToFill.buffer->getNumChannels(); ++channel)
    {
        float* const buffer = bufferToFill.buffer->getWritePointer (channel, bufferToFill.startSample);
        
        for (int sample = 0; sample < bufferToFill.numSamples; ++sample)
        {
//            const float noise = random.nextFloat() * 2.0f - 1.0f;
//            buffer[sample] = noise * mainVolume;
        }
    }
}

void MainContentComponent::releaseResources()
{
    // This will be called when the audio device stops, or when it is being
    // restarted due to a setting change.

    // For more details, see the help for AudioProcessor::releaseResources()
}

//=======================================================================
void MainContentComponent::paint (Graphics& g)
{
    // (Our component is opaque, so we must completely fill the background with a solid colour)
    g.fillAll (Colours::black);


    // You can add your drawing code here!
}

void MainContentComponent::resized()
{
    // This is called when the MainContentComponent is resized.
    // If you add any child components, this is where you should
    // update their positions.
    editor.setBounds(getLocalBounds());
}