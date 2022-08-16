package main

import "vendor:sdl2"

main :: proc() {
    // TODO
    using sdl2
    window: ^Window = ---
    renderer: ^Renderer = ---
    event: Event = ---

    Init({InitFlag.VIDEO})
    CreateWindowAndRenderer(
        800,
        400,
        {WindowFlag.RESIZABLE},
        &window,
        &renderer,
    )
    SetRenderDrawColor(renderer, 0, 0, 0, 0)
    RenderClear(renderer)
    RenderPresent(renderer)

    for !(event.type == EventType.QUIT) {
        Delay(10)
        PollEvent(&event)
    }


    DestroyRenderer(renderer)
    DestroyWindow(window)
    Quit()
}
