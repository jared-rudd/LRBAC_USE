-- Author would write a paper
!create s_author : Session
!set s_author.sessionID := 'session_author'
!insert (jared , s_author)  into UserSessions
!insert (s_author, author) into SessionRoles

-- Reviewer would write a review
!create s_rev : Session
!set s_rev.sessionID := 'session_reviewer'
!insert (paul, s_rev) into UserSessions
!insert (s_rev, reviewer) into SessionRoles

-- PC-Chair would decide the paper
!create s_chair : Session
!set s_chair.sessionID := 'session_chair'
!insert (oliver, s_chair) into UserSessions
!insert (s_chair, pcChair) into SessionRoles

-- Evaluate in USE GUI, all should be 'true : Boolean'
-- s_author.InvokeOperation(paper1, opWritePaper)
-- s_rev.InvokeOperation(paper1, opWriteReview)
-- s_chair.InvokeOperation(paper1, opDecidePaper)

check