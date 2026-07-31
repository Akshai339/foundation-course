"""Generate Foundation.ico — a lime ring on near-black, matching Zero's palette.
Pure stdlib: writes a 64x64 32-bit ICO by hand (ICONDIR + BITMAPINFOHEADER + BGRA + AND mask).
"""
import struct, os

S = 64
BG = (0x11, 0x11, 0x11)      # #111111
FG = (0xCA, 0xF7, 0x6F)      # #CAF76F

cx = cy = (S - 1) / 2.0
r_out = S * 0.40
r_in = S * 0.22

# bottom-up BGRA rows
rows = []
for y in range(S - 1, -1, -1):
    row = bytearray()
    for x in range(S):
        # supersample 3x3 for smooth edges
        hits = 0
        for sy in range(3):
            for sx in range(3):
                px = x + (sx + 0.5) / 3.0 - 0.5
                py = y + (sy + 0.5) / 3.0 - 0.5
                d = ((px - cx) ** 2 + (py - cy) ** 2) ** 0.5
                if r_in <= d <= r_out:
                    hits += 1
        a = hits / 9.0
        b = int(BG[2] + (FG[2] - BG[2]) * a)
        g = int(BG[1] + (FG[1] - BG[1]) * a)
        r = int(BG[0] + (FG[0] - BG[0]) * a)
        row += bytes((b, g, r, 255))
    rows.append(bytes(row))

xor = b"".join(rows)
and_mask = b"\x00" * ((S // 8) * S)  # fully opaque

hdr = struct.pack("<IiiHHIIiiII", 40, S, S * 2, 1, 32, 0, len(xor), 0, 0, 0, 0)
img = hdr + xor + and_mask

ico = struct.pack("<HHH", 0, 1, 1)
ico += struct.pack("<BBBBHHII", S, S, 0, 0, 1, 32, len(img), 6 + 16)
ico += img

out = os.path.join(os.path.dirname(os.path.abspath(__file__)), "Foundation.ico")
with open(out, "wb") as f:
    f.write(ico)
print("wrote", out, len(ico), "bytes")
