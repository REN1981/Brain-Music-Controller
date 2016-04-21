/*
  ==============================================================================

    MainComponent.h
    Created: 14 Apr 2016 7:05:41am
    Author:  JuanS

  ==============================================================================
*/

#ifndef MAINCOMPONENT_H_INCLUDED
#define MAINCOMPONENT_H_INCLUDED

#include "../JuceLibraryCode/JuceHeader.h"
#include "GUIComponent.h"


//==============================================================================
/*
*/
class MainContentComponent    : public AudioAppComponent
{
public:
    MainContentComponent();
    ~MainContentComponent();
//==============================================================================
    
    void prepareToPlay (int samplesPerBlockExpected, double sampleRate) override;
    void getNextAudioBlock (const AudioSourceChannelInfo& bufferToFill) override;
    void releaseResources() override;
    void paint (Graphics&) override;
    void resized() override;
//==============================================================================
    
//    void setMainVolume (float newMainVolume) {
//        mainVolume = newMainVolume;
//    }
//    
//    float getMainVolume () {
//        return mainVolume;
//    }
    
private:
    GUIComponent editor;
//    Random random;
    
//    float mainVolume;
    
    JUCE_DECLARE_NON_COPYABLE_WITH_LEAK_DETECTOR (MainContentComponent)
};

Component* createMainContentComponent()     { return new MainContentComponent(); }




#endif  // MAINCOMPONENT_H_INCLUDED
