# RPG16 Style Guide
This document is intended as a guide to those who want to create Minetest
textures in the style of RPG16. The rules below are mainly intended as
*guidelines*, rules were meant to be broken sometimes and RPG16 itself breaks
these on occasion. To keep things simple, I'll try to mention common cases
where a guideline should or shouldn't apply.

### A note about style
Before we begin, ask yourself *why* you want to make art in
the style of RPG16. I believe that an important aspect
of a game's art direction is **Stylistic Consistency**. RPG16 is a texture pack,
and is a position to use a style unlike any particular Minetest game.
If you're making a mod then keeping your textures in line with the
game(s) that you target instead of a specific texture pack may be wise.

I can't make the call of what style to use for you, but I think you should consider this.

## In general...
- Textures should aim for 16px per node
- Textures should use indexed color
- Materials should use a consistent palette
- Textures should imply form
- Textures should be lit from the top or top-left (and if it's a tool, use the 'top' as the item is oriented in the game world, not the inventory)
- Objects should not have outlines
- Materials may be anti-aliased towards the dark end of their ramp, but not the light end. Anti-aliasing must use the same color indices as the rest of the material.
- Unless otherwise stated, textures should follow [the usual modern guidelines for pixel art](http://pixeljoint.com/forum/forum_posts.asp?TID=11299)

## Inspiration and design
Like any other, the concept of RPG16 was built up from many other things.
The primary inspiration is 16-bit Japanese RPGs, particularly the Seiken
Densetsu series. Thus, reviewing environment art from this series
and various other old Squaresoft titles is a good way to get a feel for
the 'fantasy' of RPG16, if not the exact style.

For day-to-day texture work, real-life references are **mandatory**. Before
starting a texture, take a look at photographs of your subject. Do this even
if you believe that you know a subject well--*memory is often inaccurate*. When
working on sprites and tiles, avoid referencing pixel art unless you are truly
at a loss about how to produce a good result. Remember that when you reference
art, you are referencing the thoughts and ideals of another person, not the
ground truth of a subject.

Real life, though a good reference, is often not a good source of designs on its
own. Here are some questions to ask yourself when designing a texture:
- What components or materials is this object made of?
- What is this object, or its components, culturally associated with?
- How was this object assembled? Was it cobbled together? Machined? Carved? Did it grow?

In RPG16, the first two questions are usually the most important when designing
*crafted objects*. Most of these should have their individual materials clearly
visible in their design, by re-using common palettes and shapes. To determine
how to apply these materials, and to what degree, consider the third question.
Usually, the more 'basic' the components and assembly, the more obvious the
components should be in the final texture.

## Picking colors
When creating brand-new objects or effects, it's often necessary to pick a fresh
palette. Each material should have its own ramp (a progression of colors from
light to dark), and each ramp should usually be 3, 4, 5, or 6 shades:
- 3 shades: shadow, midtone, highlight
- 4 shades: shadow, midtone, highlight, plus a shade for blending or making a deeper shadow/brighter highlight
- 5 shades: shadow, midtone, highlight, plus two shades for blending
- 6 shades: like 5 shades, but extended for hueshifting or multi-context use

Ramps should employ some degree of **hueshift**. Hueshifting is the process of
changing the hue of a color as it gets lighter/darker, rather than just
changing the value. This is an important concept to apply to your ramps, as it
makes them feel more dynamic and enhances contrast. However, 3D textures tend
to 'break apart' when colors have too much contrast. Thus, you must use a gentle
touch when hueshifting and tend towards lower saturation (generally,
low-saturation colors mix hues better). If you plan to change colors quite a bit
(i.e. the Mese ramp, which spans yellow-orange-purple) then you will need a
larger ramp to accomodate the changes.

Beyond this, here are some other pointers:
- Use indexed color. This is the best way to keep your palette small and finite
- Avoid pure colors: Anything with *only* Red, Green, or Blue, anything with full saturation, and anything with no saturation. This includes white and black.
- Test in-game with **Tonemapping** enabled: Colors should be vibrant, but not painful or disjointed
- When hueshifting to a lighter shade, use warmer colors (more towards the red/yellow end of the spectrum). When hueshifting to a darker shade, use cooler colors (more towards green/blue)
- If you can see a noticeable 'jump' in your ramp, this means that the surrounding colors must be adjusted. Ramps should usually be smooth.
- You may recolor existing ramps, but be sure to manually adjust the results afterwards.

## Materials
In most cases any 'material' (wood, stone, metal, etc.) will use a single color
ramp for all textures that feature it. If the material is used in a variety of
places, this may sometimes call for extending the ramp lighter/darker and using
a subset per-texture, but otherwise it should follow the rules above.

Materials of the same 'class' should be distinguishable. In cases where a 'class'
covers many materials (like wood, for instance), it may be useful to build a
palette of existing nodes in-game and look for underused colors to make the new
material more distinct. The other main distinguishing element is the pattern of
the texture itself; the shapes and surface lighting used can make 2 objects with
the same color appear distinct as well.

These patterns and shapes are also useful for giving a material a 'theme'.
This isn't always necessary, but it's useful when making textures for
unique elements such as tools and armor (more on that in the next section).
Here are a few examples, for inspiration:
- Wood/Stone: **Rough** -- Wood and stone equipment is designed to look poorly hand-crafted, often with string or nails holding everything together. In stone tools, the stone is typically cracked or chipped to suggest novice workmanship.
- Bronze/Steel: **Sensible** -- These are standard materials from history and modern times, and they should look the part.
- Silver: **Sleek** -- Everything made of silver is adorned with spines and points to give a sharper feeling to it.

When designing existing sci-fi or fantasy materials, it's sometimes useful to make
*subtle* references to popular culture (mithril armor being chainmail,
for instance). In cases where an advanced material is totally original,
adding unnecessary flair and impractical designs is a great way to sell that
unreal feeling. Try to keep these flourishes somewhat consistent though, the
material must still have a unifying theme to it.

## Creating vs copying
One of the core tenets of RPG16 is "Quantity over quality". This may come as a
surprise, because the textures are designed to give the user an *impression* of
quality with only minimal production values to back it up. The core of this
strategy is knowing when, and how, to re-use assets.

Generally, the rule of thumb to follow is: "The closer to/more involved with the
player it is, the more custom the asset should be". Something like a tool or
piece of armor should feel unique because the player is likely to associate with
it, as opposed to something like a tree trunk or a tuft of grass. On the other
hand, it's important not to re-use *too aggressively* either. If something truly looks
unique in your references, then it should probably be given a design to
match. (The palm tree trunk from Ethereal and Moretrees is a good example of this)

When copying an asset, it shouldn't be completely identical to the original.
The main approach to distinguishing a copy from the original is via
palette-swapping. This usually means recoloring or replacing the ramps in
the piece. See "Materials" and "Picking colors" above for more details on how to do that.

## Texturing meshes
In Minetest, meshes don't yet self-shade. This means that mesh textures
must take light into account. As in most textures, assume the light is coming
directly from the top or slightly from the top-left. *Unlike* most textures,
it may be worthwhile to add extra fake lights or ambient lighting. Try to avoid
this for the most part, but add enough that the model has a little bit of
form and texture when viewed from any angle.

In cases of texture packs, UVs may not always be in your control. Unfortunately, UVs
in Minetest mods are often completely wrong. The nature of the problems, and
their solutions, will vary. In cases of pixel stretching, try to adjust the
pixel aspect ratio of the face being textured to minimize the effect. In cases
of partial overlap (i.e. two unrelated faces using the same part of a texture),
the easiest solution is to file a bug report to the author. If the faces are aligned
reasonably, then you may still manage to mask the overlap with careful
texture-work. Otherwise, there's no real solution and the texture must be skipped.

## Texturing UI elements
When making textures for UI elements (either in formspecs or HUD), work at 1x
scale and **DO NOT TRUST THE MOD AUTHOR UNDER ANY CIRCUMSTANCE** (except in one
specific case, listed below). Instead, measure the output with a screenshot
rendered at 1080p and use the pixel size to determine texture resolution.
GIMP's "Measure Tool" (Shift+M) is a good way to do this.

Why 1x scale? 1x conflicts with the scale of 16x16 item textures, and
introduces mixels (generally not a good thing). However, rendered node item
textures already create this conflict and some UI textures render at odd-numbered
resolutions. Thus, working at 1x scale is quite convenient and
doesn't really introduce new issues.

UI element textures also have a few important details and caveats:
- Backgrounds should always be dark
- Backgrounds should have a light trim for visibility
- Elements should have a 1px border, we can do this because UI elements are high-resolution and benefit more from the contrast
- If a formspec background can't easily be made at 1x scale (usually when 9-slice isn't being used), check the original background being replaced. If it's dark, leave it as-is. If it's light, break the rule about scale and use the source resolution.
- Lastly, formspec icons should follow the same rules. In cases where the scale rules are being violated icons should be symbolic, and in cases where the scale rules are being upheld icons should be properly rendered in color like items

## Development workflow
This last section is a set of general advice for texture making. It's not
entirely specific to RPG16, but hopefully gives some ideas for improving your
workflow...

I know of two major approaches to pixel art: *lineart based*
and *block-in based*. I am a strong proponent of the latter
method because it allows you to work in a more efficient manner and forces you
to consider form early in the process. If you haven't settled on a workflow, I
recommend looking over [this piece about the block-in workflow](https://www.deviantart.com/cyangmou/art/Pixel-Art-Process-413418385)
by the professional artist Cyangmou. I found it very helpful and informative
when I first began making pixel art.

If you are learning art in general, I would also offer a couple pieces of
advice. First, avoid "How to draw X" tutorials. These will leave you
with good-looking art, but they will not *teach you* the fundamental skills
that you need to make art at a consistent quality level. Worse, you probably cannot
judge the skill of the teacher at your current level. I have seen many tutorials
that offer completely wrong advice but probably look reasonable to a
less-skilled observer. Instead, I recommend learning the fundamentals of
art: Anatomy, Proportion, Color Theory, Perspective, Form, Construction, etc.
These skills are transferable across different mediums, so you don't necessarily
need to stick to pixel art when learning them. Find a better artist (or ideally,
a helpful community of better artists), practice, keep an open mind, and use their critique to improve.

When looking for art software, it's important to use something that is well-adjusted
for pixel art. [Anything on this list](https://lospec.com/pixel-art-software-list)
should be fine, but here are a few key features to look for in general:
- **Indexed color mode and palette management** -- This is key for keeping your color-count reasonable. Be sure that your software of choice makes building and maintaining palettes painless, or you'll lose a lot of time on color management.
- **1-click color-picking** -- The faster you can change colors, the better. This is something that you do all the time, so having to switch to a color-picker tool doesn't really cut it for efficient pixel art.
- **Tiling mode** (or easy canvas wrapping) -- Having a way to view textures repeated several times without manual copying is vital for making node textures that repeat nicely.

As for good-to-have (but unnecessary) quality of life features:
- **Dithering tools** -- Dithering can be made manually, but automatic solutions will usually let you work faster
- **Indexed color masking** -- Less vital at low resolutions, but occasionally handy for quick shading
- **Grid overlay** -- Useful for some UV maps
