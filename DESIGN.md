---
name: Care Companion
description: A warm family photo frame paired with a crisp household care ledger.
colors:
  family-ink: "#17231d"
  frame-night: "#0f1115"
  paper: "#ffffff"
  canvas: "#f8fafc"
  care-blue: "#2563eb"
  confirmation-green: "#059669"
  checkin-coral: "#e76f51"
  schedule-amber: "#d97706"
  text-main: "#0f172a"
  text-muted: "#64748b"
  divider: "#e2e8f0"
typography:
  display:
    fontFamily: "Literata, Georgia, serif"
    fontSize: "clamp(1.625rem, 4vw, 2rem)"
    fontWeight: 700
    lineHeight: 1.2
    letterSpacing: "-0.02em"
  title:
    fontFamily: "Literata, Georgia, serif"
    fontSize: "1.25rem"
    fontWeight: 700
    lineHeight: 1.3
  body:
    fontFamily: "Atkinson Hyperlegible, -apple-system, sans-serif"
    fontSize: "0.875rem"
    fontWeight: 400
    lineHeight: 1.5
  label:
    fontFamily: "Atkinson Hyperlegible, -apple-system, sans-serif"
    fontSize: "0.8125rem"
    fontWeight: 700
    lineHeight: 1.3
rounded:
  control: "12px"
  surface: "16px"
  feature: "24px"
  pill: "999px"
spacing:
  xs: "8px"
  sm: "12px"
  md: "16px"
  lg: "24px"
components:
  button-primary:
    backgroundColor: "{colors.care-blue}"
    textColor: "{colors.paper}"
    typography: "{typography.label}"
    rounded: "{rounded.control}"
    padding: "12px 20px"
  card:
    backgroundColor: "{colors.paper}"
    textColor: "{colors.text-main}"
    rounded: "{rounded.feature}"
    padding: "24px"
  status-pill:
    backgroundColor: "{colors.family-ink}"
    textColor: "{colors.paper}"
    typography: "{typography.label}"
    rounded: "{rounded.pill}"
    padding: "8px 16px"
---

# Design System: Care Companion

## Overview

**Creative North Star: "The Family Daybook"**

Care Companion joins two modes of the same household: an ambient frame that feels like home and an operations surface that makes care state unmistakable. Family imagery carries the patient view; the caretaker view uses a brighter paper-and-ledger rhythm with denser controls. The system is warm without becoming childish and operational without becoming clinical.

**Key Characteristics:**

- Full-bleed family photographs on the care-receiver surface.
- Paper-white task surfaces against quiet neutral canvases.
- Green for confirmation, coral for personal check-ins, blue for caretaker actions, and amber for schedules.
- Large, readable patient controls and compact but legible caretaker controls.

## Colors

The palette combines domestic warmth with clear operational state. Family Ink and Frame Night anchor the shell; accents carry meaning rather than decoration.

**The State Has a Color Rule.** Green confirms, coral asks for attention, blue dispatches an action, and amber marks time or schedule. Do not swap those roles casually.

## Typography

**Display Font:** Literata (with Georgia fallback)  
**Body Font:** Atkinson Hyperlegible (with system fallback)

Literata gives family messages a personal, story-like cadence. Atkinson Hyperlegible keeps controls and logs unusually clear, especially on the patient-facing tablet.

**The Across-the-Room Rule.** Patient prompts and decisions must remain readable from several feet away; density belongs on the caretaker side only.

## Layout

The receiver is a single full-screen stage: imagery first, small ambient chrome second, and protected-focus overlays for check-ins and medication. The caretaker uses a centered desktop container, horizontal task navigation, and one focused manager at a time. At narrow widths, dense grids collapse to one or two columns, headers stack, and the launcher switches from split view to role tabs.

Spacing follows an 8/12/16/24px rhythm. Surfaces use 24px padding on desktop and 14–18px on compact screens.

## Elevation & Depth

Depth is structural: the photo frame uses dark overlays for legibility, while caretaker surfaces use soft downward shadows against a cool canvas. Modals receive the strongest elevation because they interrupt and protect a required response. Colored zero-offset glows and elastic motion are not part of the system.

## Shapes

Controls use gently curved 12px corners, working surfaces use 16–24px corners, and small status controls may use full pill geometry. Patient response targets are broader and rounder than caretaker inputs, but both share the same softened form language.

## Components

### Buttons

- Primary caretaker buttons use Care Blue, bold labels, and 12–16px corners.
- Patient responses use large green, amber, or coral surfaces with both text and the explicitly associated emoji.
- Hover and entrance motion use smooth exponential deceleration; focus uses a visible high-contrast outline.

### Cards / Containers

- Task surfaces are Paper on Canvas with 16–24px corners and generous internal padding.
- Avoid nesting decorative cards. A child container must organize a distinct task or state.

### Inputs / Fields

- Inputs use a white surface, a quiet divider stroke, 12–16px corners, and a clear accent-color focus state.
- Labels are compact and bold; placeholder text never carries required information.

### Navigation

- Caretaker tabs sit in a shared neutral track with one white active tab.
- The launcher uses compact dark chrome and keeps direct-open actions available beside the split-view control.

### Care Takeover

The incoming check-in takeover centers one sender, one explanation, and one opening action. Its detail view preserves the sender photo, spoken caption, three large responses, voice transcript, and escalation state in one protected interaction.

## Do's and Don'ts

### Do:

- **Do** let real family imagery dominate idle receiver states.
- **Do** keep all patient actions large, labeled, and voice-supported.
- **Do** keep event state synchronized and timestamped across surfaces.

### Don't:

- **Don't** make the receiver feel like a settings dashboard.
- **Don't** use color as the only carrier of a care state.
- **Don't** introduce elastic motion, decorative glow, or small unlabeled patient controls.

