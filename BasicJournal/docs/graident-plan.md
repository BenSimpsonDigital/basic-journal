 Gradient Enhancement Plan
 Overview
Plan to update TodayView gradient animations and mood system with new color schemes and enhanced visual effects.
 1. Mood System Updates
 Current State
- **5 moods**: Low(0), Down(1), Okay(2), Good(3), Great(4)
- **Purple-to-blue transition** between Low and Down (harsh contrast)
- App icon mappings: Cloud/Low, Cloud/Down, Sun/Okay, Sun/Good, Sparkles/Great
 Target State
- **5 moods**: Low(0), Heavy(1), Okay(2), Happy(3), Amazing(4)
- **Cool blues → deeper blues** for Low/Heavy (subtle distinction)
- Updated app icon mappings (TBD)
 Files to Modify
1. **Models/Entry.swift**
   - Update mood structure documentation
   - Update `moodAppIcon` computed property with new mood names
   - Consider if app icon system needs updates
2. **Views/Theme.swift**
   - Update `moodPillGradients` array with new color schemes
   - Modify `moodBasedOrbGradient` function
   - Update `moodBasedMeshColors` function  
   - Update `moodBasedRadialOrbColors` function
 Color Scheme Updates
 New Mood Pill Gradients (Linear 4-color)
static let moodPillGradients: [[Color]] = [
    // Low - Cool light blues
    [Color(red: 0.70, green: 0.80, blue: 0.95), Color(red: 0.65, green: 0.75, blue: 0.90), 
     Color(red: 0.60, green: 0.70, blue: 0.85), Color(red: 0.55, green: 0.65, blue: 0.80)],
    
    // Heavy - Deeper blues  
    [Color(red: 0.50, green: 0.60, blue: 0.80), Color(red: 0.45, green: 0.55, blue: 0.75),
     Color(red: 0.40, green: 0.50, blue: 0.70), Color(red: 0.35, green: 0.45, blue: 0.65)],
     
    // Okay - Warm cream to soft rose (existing, keep)
    [...],
    
    // Happy - Vibrant gold to coral (enhanced from Good)
    [...],
    
    // Amazing - Bright yellow to vibrant pink (enhanced from Great)
    [...]
]
2. Gradient Animation Enhancements
Current Animation States
- subtle: 6s duration, 0.01 amplitude
- hyped: 1.2s duration, 0.03 amplitude  
- calm: 8s duration, 0.005 amplitude
Target Enhancement: Larger Amplitude Changes
- subtle: 6s duration, 0.02 amplitude (doubled)
- hyped: 1.2s duration, 0.05 amplitude (increased 66%)
- calm: 8s duration, 0.005 amplitude (unchanged - keep minimal)
Files to Modify
1. Views/TodayView.swift
   - Update MeshAnimationState enum amplitude values
   - Review animation duration ratios
2. Views/Components/AnimatedGradientOrb.swift
   - Increase scale animation range: 0.85-1.15 (from 0.9-1.05)
   - Increase blur animation range: 15-35px (from 18-30px)
   - Potentially increase movement ranges for position animations
Specific Animation Changes
BottomMeshGradient (iOS 18+)
enum MeshAnimationState {
    case subtle      // 6s duration, 0.02 amplitude (was 0.01)
    case hyped       // 1.2s duration, 0.05 amplitude (was 0.03)
    case calm        // 8s duration, 0.005 amplitude (unchanged)
}
AnimatedGradientOrb Enhancements
// Scale animation
.scaleEffect(effectScale)
.onAppear {
    withAnimation(.easeInOut(duration: 4).repeatForever(autoreverses: true)) {
        effectScale = 1.15  // was 1.05
    }
}
// Blur animation  
.blur(radius: blurRadius)
.onAppear {
    withAnimation(.easeInOut(duration: 4).repeatForever(autoreverses: true)) {
        blurRadius = 35    // was 30
    }
}
3. UI Component Updates
Files to Modify
1. Views/Components/MoodPill.swift
   - Update mood label text: "Down" → "Heavy", "Good" → "Happy", "Great" → "Amazing"
   - Verify spring animations still work well with new mood names
2. Views/TodayView.swift 
   - Update any hard-coded mood references in comments or documentation
4. Implementation Steps
Phase 1: Color System Updates
1. Update Theme.swift with new mood gradient arrays
2. Update Entry.swift mood structure and mappings
3. Test color rendering in simulator
Phase 2: Animation Enhancements  
1. Update mesh gradient animation amplitudes
2. Enhance AnimatedGradientOrb ranges
3. Test animation smoothness and performance
Phase 3: UI Updates
1. Update MoodPill labels
2. Update any app icon mappings if needed
3. Full integration testing
Phase 4: Polish
1. Verify accessibility (reduceMotion preferences)
2. Test across iOS 17/18 compatibility
3. Performance profiling
5. Questions for Finalization
Pending Decisions
1. App Icon System: Should app icons be updated to match new mood names?
   - Current: Cloud/Low, Cloud/Down, Sun/Okay, Sun/Good, Sparkles/Great
   - Options: Keep existing, update names only, or redesign mapping
2. Animation Distribution: Should enhanced animations apply equally to all states?
   - Option A: All states get increased amplitude
   - Option B: Only certain states (subtle/hyped) enhanced, calm unchanged
   - Current plan: Enhanced subtle/hyped, calm unchanged
3. Testing Preview: Create test view to preview new mood colors before full implementation?
6. Technical Considerations
Performance Impact
- Larger amplitude animations may increase battery usage
- Test on older devices for performance regression
- Monitor memory usage with enhanced animations
Compatibility
- Ensure iOS 17 fallback (GradientOrb) works with new colors
- Test accessibility animations with increased amplitudes
- Verify reduceMotion preference still respected
Visual Design
- New blue progression should be tested across device sizes
- Verify contrast ratios for accessibility
- Test in different lighting conditions (dark/light mode)
7. Success Criteria
Functional Requirements
- [ ] All 5 mood names updated correctly
- [ ] Low/Heavy colors show subtle blue distinction
- [ ] Animation amplitudes increased as specified
- [ ] No performance regression on target devices
Visual Requirements  
- [ ] Smooth mood transitions maintained
- [ ] Enhanced animations feel organic, not jarring
- [ ] Color harmony maintained across all moods
- [ ] Accessibility standards met
Technical Requirements
- [ ] iOS 17/18 compatibility maintained
- [ ] No breaking changes to existing API
- [ ] Memory usage within acceptable limits
- [ ] Build time not significantly impacted
