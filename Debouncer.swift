import Foundation

protocol DebouncerDelegate: AnyObject {
    func debounceCodeBlock(blockToDebounce: (() -> Void)?)
    func cancelScheduledBlock()
}

final class Debouncer {
        
    private var blockToDebounce: (() -> Void)?
    
    private var debounceInterval: TimeInterval
    
    private var debounceTimer: Timer?
    
    init(debounceInterval: TimeInterval) {
        self.debounceInterval = debounceInterval
    }
    
    private func cancelPreviouslyScheduledBlockAndSetScheduleForNewBlock() {
        cancelScheduledBlock()
        debounceTimer = Timer.scheduledTimer(timeInterval: debounceInterval,
                                             target: self,
                                             selector: #selector(runBlockToDebounce),
                                             userInfo: nil,
                                             repeats: false)
    }
    
    @objc
    private func runBlockToDebounce() {
        blockToDebounce?()
    }
}

extension Debouncer: DebouncerDelegate {
    
    func debounceCodeBlock(blockToDebounce: (() -> Void)?) {
        self.blockToDebounce = blockToDebounce
        cancelPreviouslyScheduledBlockAndSetScheduleForNewBlock()
    }
    
    func cancelScheduledBlock() {
        debounceTimer?.invalidate()
    }
}
