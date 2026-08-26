# 14 — Decision Log Template

I use a decision log when a choice is important enough that I may ask "why did I do this?" six months later.

Copy this section into private or sanitized public documentation as appropriate.

```text
Decision:
Date:
Status: proposed / accepted / replaced

Problem:
What was I trying to solve?

Constraints:
What technical, ownership, cost, security, or operational constraints mattered?

Options considered:
1.
2.
3.

Decision:
What did I choose?

Why:
Why did this option fit the situation?

Security impact:
What new risk does this introduce?
What risk does it reduce?

Operational impact:
Who maintains it?
How is it recovered?
How is access removed?

Validation:
How did I verify that it works?

Rollback:
How would I undo the change safely?

References:
Which official documentation informed the decision?
```

For a public repository, sanitize the entry before publishing it. A decision log should explain engineering reasoning without becoming an inventory of exploitable production details.
