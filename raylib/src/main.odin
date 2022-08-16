package main

import "core:fmt"
import "core:math"
import "vendor:raylib"

Player :: struct {
    x: i32,
    y: i32,
    w: i32,
    h: i32,
}

Obstacle :: struct {
    x: i32,
    y: i32,
    w: i32,
    h: i32,
}

DrawPlayer :: proc(player: Player, obstacle: Obstacle) {
    using raylib
    color := BLUE
    if
       player.x + player.w >= obstacle.x &&
       player.y + player.h >= obstacle.y &&
       player.x <= obstacle.x + obstacle.w &&
       player.y <= obstacle.y + obstacle.h {
        color = RED
    }
    DrawRectangle(player.x, player.y, player.w, player.h, color)
}

DrawObstacle :: proc(obstacle: Obstacle) {
    using raylib
    DrawRectangle(obstacle.x, obstacle.y, obstacle.w, obstacle.h, GREEN)
}


main :: proc() {
    using raylib
    using fmt

    player := Player{1, 2, 100, 100}
    obstacle := Obstacle{0, 0, 100, 100}

    SetConfigFlags({ConfigFlag.WINDOW_RESIZABLE})
    println("Hello World")
    width: i32 : 800
    height: i32 : 600
    InitWindow(width, height, "Hello World")

    for !WindowShouldClose() {
        obstacle.x =
            GetScreenWidth() / 2 - 50 + cast(i32)(math.cos(GetTime()) * 100)
        obstacle.y =
            GetScreenHeight() / 2 - 50 + cast(i32)(math.sin(GetTime()) * 100)
        if IsKeyDown(KeyboardKey.K) {
            player.y -= 1
        } else if IsKeyDown(KeyboardKey.L) {
            player.x += 1
        } else if IsKeyDown(KeyboardKey.J) {
            player.y += 1
        } else if IsKeyDown(KeyboardKey.H) {
            player.x -= 1
        }
        BeginDrawing()
        ClearBackground(BLACK)
        DrawPlayer(player, obstacle)
        DrawObstacle(obstacle)
        EndDrawing()
    }

    CloseWindow()
}
