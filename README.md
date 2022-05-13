## Memory Leaks in iOS
A memory leak occurs when a given memory space cannot be recovered by the ARC (Automatic Reference Count)because it is unable to tell if this memory space is actually in use or not. One of the most common problems that generate memory leaks in iOS is retained cycles.

## Memory leaks prevention
Memory leaks often happen without notice. Although best practices like using a weak reference to self inside closures help a lot, it’s usually not enough to prevent you from finding a certain memory peak during the development of a project.

We can use memory graph debugging or Xcode Instruments to help find and fix leaked and abandoned memory. However, using tools manually requires us to make it part of our regular workflow to prevent memory leaks from sneaking in.

## Avoiding memory leaks using unit tests
Making it easy to test your app for memory leaks prevents us from introducing them without notice. We will not avoid all leaks, but it will decrease the chance. A good practice is to write a unit test reproducing a memory leak you encountered to ensure the memory leak does not return in the future.

I provided a very simple project a some leaking classes and some not, with also unit test to get alarmed when they occur.

