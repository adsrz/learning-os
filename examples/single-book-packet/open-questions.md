# Open Questions

## Review State Convention

- `live`: the issue still shapes the next bounded packet
- `watch`: the issue is mostly repaired, but worth a lighter later revisit

## Active Questions

### `Opening mechanism and thesis`

- Status: `live`
- Why still live: the packet has first framing, but the source's organizing mechanism is not yet precise enough for deeper cumulative reading
- Next best check: explain the main mechanism or thesis in source-owned terms before any broadening or comparison
- Last seen: `2026-04-01 first framing pass`

### `Slow-read boundary`

- Status: `watch`
- Why still live: the packet already knows where detail is likely to matter, but the exact slow-read boundary is not yet proven by a deeper pass
- Next best check: identify which parts of the source must be read more slowly before the packet can move into section-boundary work
- Last seen: `2026-04-01 first framing pass`
