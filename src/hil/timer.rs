pub trait Timer {
    fn now(&self) -> u32;
    fn oneshot(&self, interval: u32);
    fn repeat(&self, interval: u32);
}

pub trait TimerClient {
    fn fired(&self, now: u32);
}

