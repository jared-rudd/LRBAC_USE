-- Roles 

!create author : Role
!set author.name := 'Author'
!set author.maxUsers  := -1

!create reviewer : Role
!set reviewer.name := 'Reviewer'
!set reviewer.maxUsers:= -1

!create pcMember : Role
!set pcMember.name := 'PC Member'
!set pcMember.maxUsers:= -1

!create pcChair : Role
!set pcChair.name := 'PC Chair'
!set pcChair.maxUsers := 1

!insert (pcChair, pcMember) into RoleHierarchy
!insert (pcMember, reviewer) into RoleHierarchy


-- Operations 

!create opWritePaper : Operation
!set opWritePaper.name := 'writePaper'

!create opReadReview : Operation
!set opReadReview.name := 'readReview'

!create opWriteReview : Operation
!set opWriteReview.name := 'writeReview'

!create opDiscussPaper : Operation
!set opDiscussPaper.name := 'discussPaper'

!create opDecidePaper : Operation
!set opDecidePaper.name := 'decidePaper'


-- Resources

!create paper1 : Object
!set paper1.name := 'Paper-010000'


-- Permissions

!create p_write : Permission
!set p_write.name := 'perm_writePaper'
!insert (p_write, paper1) into PermObjects
!insert (p_write, opWritePaper) into PermOperations

!create p_readRev : Permission
!set p_readRev.name := 'perm_readReview'
!insert (p_readRev, paper1) into PermObjects
!insert (p_readRev, opReadReview) into PermOperations

!create p_writeRev : Permission
!set p_writeRev.name := 'perm_writeReview'
!insert (p_writeRev, paper1) into PermObjects
!insert (p_writeRev, opWriteReview) into PermOperations

!create p_discuss : Permission
!set p_discuss.name := 'perm_discussPaper'
!insert (p_discuss, paper1) into PermObjects
!insert (p_discuss, opDiscussPaper) into PermOperations

!create p_decide : Permission
!set p_decide.name := 'perm_decidePaper'
!insert (p_decide, paper1) into PermObjects
!insert (p_decide, opDecidePaper) into PermOperations

-- Permissions Role Linkage
!insert (author, p_write) into PermAssignment
!insert (reviewer, p_writeRev) into PermAssignment
!insert (pcMember, p_discuss) into PermAssignment
!insert (pcMember, p_readRev) into PermAssignment
!insert (pcChair, p_decide) into PermAssignment

-- SSD
!create ssdAR : SSDRole
!set ssdAR.name := 'Author_vs_Reviewer'
!insert (ssdAR, author) into SSDConstraint
!insert (ssdAR, reviewer) into SSDConstraint

-- Users
!create jared : User
!set jared.userID := 'jared'
!insert (jared, author) into UserAssignment

!create paul : User
!set paul.userID := 'paul'
!insert (paul, reviewer) into UserAssignment

!create oliver : User
!set oliver.userID := 'oliver'
!insert (oliver, pcChair) into UserAssignment
