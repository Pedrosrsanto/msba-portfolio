# Markstrat: Writing the Rules for an AI That Runs the Company

> **Status: in progress.** The simulation runs through seven decision rounds, ending December 5, 2026. Results will be added as they come in.

**Course:** MARK 6555 Applied Product Management, Georgetown MSBA (Fall 2026, Prof. Luc Wathieu)
**Team 6, Firm R "the Rhinos":** Finley Mynott, Siho Lee, Riya Pradhan, Pedro Sanchez, Kate Smith
**Focus:** AI governance, prompt and process design, marketing strategy
**My roles:** Constitution steward, verifier and backup AI operator

---

## The setup

Markstrat is a marketing strategy simulation. Each team runs a firm competing against the other teams in its industry over seven decision rounds. Every round they set the product portfolio, prices, production, advertising, sales force, R&D projects and market research purchases. Teams are graded on **cumulative earnings before taxes at the end of round 7**.

Each team in the course was assigned a different model for using AI. **Ours was "AI as Autopilot": the AI makes every analysis and every decision, and the team never overrides it.**

That changes what the team actually does. We don't decide prices or budgets. Our only lever is **the written instructions the AI follows**, which we call the constitution, and the process around it.

## The constitution

We wrote a constitution for Claude covering:

**Objectives, in priority order**
1. Maximize cumulative EBT at the end of round 7. Share and awareness only matter if they feed profit before the game ends
2. Never let a plan depend on cash the firm doesn't have
3. Invest early, harvest late. As the end approaches, slow-payback investments lose value
4. Avoid the big loss. When two options have similar expected profit, take the less risky one
5. Finish with a coherent portfolio, each brand with one clear target segment

**Twelve decision principles**, including:
- **Produce slightly optimistic, net of inventory.** A stockout loses the sale forever, while a surplus only costs holding, so shade production above forecast by at most 10%
- **Price for profit after channel margins.** Never buy share at a loss
- **Every dollar must pay back before round 7**, and every research study must answer a named question
- **No dramatic changes on thin evidence.** A price move over 10%, a new target segment or a brand launch needs support from two independent data sources
- **Expect competitors to react.** Reject any plan that only works if they stand still

**A fixed 13-step analysis** every round: from explaining last period's results against the previous expectations, through segments, positioning maps, conjoint results and competitors, to a brand-by-brand decision comparing at least two options, then a low-demand stress test.

**A strict output format and validation checklist.** One authoritative decision table that can be entered with zero interpretation, the budget math shown, every change from last round justified, and a pass/fail check on every item before the AI finishes.

**Rules for missing data.** The AI never invents or carries forward a number. If a core input is missing, it stops and says so instead of deciding.

## The process around it

The constitution only works if the team can't quietly steer the AI. So we built in controls:

- **One run per round.** A fresh chat, a standard opening message, no regenerating and no edited prompts
- **No overrides.** We enter exactly what the AI produces, even when we disagree. Disagreements go in a log and can only become a constitution change for a *future* round
- **Separation of duties.** The person who runs the AI never enters the decisions, and the person who enters them never verifies them
- **A rule-vs-decision line.** The constitution can set goals and steps, like "stay within budget", but never a specific price, budget or quantity
- **Full records.** Every conversation, data pack, run log and constitution version is saved, and old versions are never overwritten
- **Pre-agreed fixes for gray areas.** One pre-written repair message is allowed if an answer is cut off or rejected by the simulation, and it asks only for the broken item

## My part

- **Constitution steward:** I keep the single current version, write proposed changes between rounds and record every change with its reason and the team vote
- **Verifier:** I check every number entered into Markstrat against the AI's saved conversation and give the final sign-off
- **Backup operator:** if the primary operator can't run a round, I run it, and the verifier role passes to a teammate for that round

## Results

| Round | Cumulative EBT | Market share | Key AI decisions | Constitution changes |
|---|---|---|---|---|
| 1 | [ADD] | [ADD] | [ADD] | v3.0 adopted |
| 2 | [ADD] | [ADD] | [ADD] | [ADD] |

## What I'm learning

Writing instructions for an AI that you can't override is mostly about deciding, in advance, what good judgment looks like. Most of our constitution isn't marketing theory. It's guardrails: what to do when data is missing, when evidence is thin, when two goals conflict. The same questions come up whenever a company hands real decisions to an AI system.

## Files

| Folder | Contents |
|---|---|
| `report/Team6_Rhinos_AI_Charter_and_Constitution.pdf` | Team AI charter and the full constitution (v3.0) |
