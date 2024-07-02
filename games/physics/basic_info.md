# Pros and Cons

Pros:

- time will be saved if dev reuses one general purpose physics engine for all his games (if they in need)
- high quality physics can level up the game in eyes of the players
- certain mechanics can be powered by physics

Cons:

- hight CPU usage
- no need for singles cases
- can be hard to maintaine for a single indie dev

# Complexity of the engine (approaches)

## Types of Objects

- rigid bodies: different parts of the physics body can be treated differently
- mass-aggregate: eash physics body treated as single object of the certain mass

## Contact (Collisions) Resoulution

- iterative approach
- "Jacobian-based" approach
- reduced coordinate approach

## Impulses and Forces

- force-based approach: impulses are simply forces acting over a very small period of time
- impule-based approach

