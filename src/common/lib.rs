//! A library for common operations in the Tock OS.

#![crate_name = "common"]
#![crate_type = "rlib"]
#![feature(core_intrinsics,const_fn,fixed_size_array)]
#![no_std]

extern crate support;

pub mod ring_buffer;
pub mod queue;
pub mod utils;
pub mod volatile_cell;
pub mod math;

pub use queue::Queue;
pub use ring_buffer::RingBuffer;
pub use volatile_cell::VolatileCell;
