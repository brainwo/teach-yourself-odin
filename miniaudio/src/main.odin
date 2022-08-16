package main

import "core:fmt"
import "vendor:miniaudio"

main :: proc() {
    // TODO
    using fmt

    engine: miniaudio.engine = ---

    result := miniaudio.engine_init(nil, &engine)

    if result != miniaudio.result.SUCCESS {
        println("Failed to initialize audio engine")
    }

}
