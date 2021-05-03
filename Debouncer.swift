class Debouncer {

    private var blockToRun: (()->Void)?

    private var timeIntervalDebounce: TimeInterval

    private var timerRunBlockToRun: Timer?

    init(timeIntervalDebounce: TimeInterval) {
        self.timeIntervalDebounce = timeIntervalDebounce
    }

    func bounceWithBlock(blockToRun: (()->Void)?) {
        self.blockToRun = blockToRun
        cancelPreviouslyScheduledBlockAndSetScheduleForNewBlock()
    }

    private func cancelPreviouslyScheduledBlockAndSetScheduleForNewBlock() {
        timerRunBlockToRun?.invalidate()
        timerRunBlockToRun = Timer.scheduledTimer(timeInterval: timeIntervalDebounce,
                                                  target: self,
                                                  selector: #selector(runBlockToRun),
                                                  userInfo: nil,
                                                  repeats: false)
    }

    @objc private func runBlockToRun() {
        blockToRun?()
    }
}
