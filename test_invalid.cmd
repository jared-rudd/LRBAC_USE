-- Author tries to decide the paper
!create s_author : Session
!set s_author.sessionID := 'session_author'
!insert (jared , s_author)  into UserSessions
!insert (s_author, author) into SessionRoles

-- Reviewer tries to write a paper
!create s_rev : Session
!set s_rev.sessionID := 'session_reviewer'
!insert (paul, s_rev) into UserSessions
!insert (s_rev, reviewer) into SessionRoles

-- PC-Chair tries to write a review
!create s_chair : Session
!set s_chair.sessionID := 'session_chair'
!insert (oliver, s_chair) into UserSessions
!insert (s_chair, pcChair) into SessionRoles

-- Evaluate in USE GUI, all should be 'false : Boolean'
-- s_author.CheckAccess(paper1, opDecidePaper)
-- s_rev.CheckAccess(paper1, opWritePaper)
-- s_chair.CheckAccess(paper1, opWriteReview)

check