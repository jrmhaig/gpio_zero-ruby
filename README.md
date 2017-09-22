# GPIO Zero for Ruby

An attempt to create GPIO Zero
[GPIO Zero](https://gpiozero.readthedocs.io/en/stable/) for Ruby. Very basic at the
moment!

## Getting started

I haven't worked out how to automatically start pigpiod so it has to be started
with:

```
/usr/bin/pigpiod
```

After that connect an LED up to pin 4 and try:

```
bundle install
bundle exec ruby test.rb
```
