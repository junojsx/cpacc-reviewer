-- Seed practice questions for CPACC and WAS mock tests.
-- These are original practice questions written to cover the IAAP domains.
-- They are NOT real exam items and should not be treated as such.
--
-- Re-running this script wipes existing questions and attempt_answers. Attempts rows
-- remain but will point to non-existent question_ids.

truncate table public.questions cascade;

-- ============================================================
-- CPACC
-- ============================================================

insert into public.questions (exam_type, domain, question, choices, correct_answer, explanation) values

-- D1: Disabilities, Challenges, and Assistive Technologies
('CPACC', 'Disabilities, Challenges, and Assistive Technologies',
 $$What is a screen reader primarily designed to do?$$,
 $$[
   {"key":"A","text":"Magnify portions of the screen for users with low vision"},
   {"key":"B","text":"Convert on-screen content into synthesized speech or braille output"},
   {"key":"C","text":"Translate spoken language into text for deaf users"},
   {"key":"D","text":"Adjust display colors for color-blind users"}
 ]$$::jsonb,
 'B',
 $$Screen readers programmatically read out content via speech synthesis and can also drive refreshable braille displays.$$),

('CPACC', 'Disabilities, Challenges, and Assistive Technologies',
 $$Which assistive technology is most commonly used by people with severe motor impairments who cannot operate a standard keyboard or mouse?$$,
 $$[
   {"key":"A","text":"Screen reader"},
   {"key":"B","text":"Switch access device"},
   {"key":"C","text":"Refreshable braille display"},
   {"key":"D","text":"Closed captions"}
 ]$$::jsonb,
 'B',
 $$Switch access lets users operate a device with one or two buttons (or other input), often combined with scanning interfaces.$$),

('CPACC', 'Disabilities, Challenges, and Assistive Technologies',
 $$Which of the following is classified primarily as a cognitive disability?$$,
 $$[
   {"key":"A","text":"Tinnitus"},
   {"key":"B","text":"Glaucoma"},
   {"key":"C","text":"Dyslexia"},
   {"key":"D","text":"Arthritis"}
 ]$$::jsonb,
 'C',
 $$Dyslexia is a learning disability that affects reading and language processing — a cognitive disability.$$),

('CPACC', 'Disabilities, Challenges, and Assistive Technologies',
 $$"Low vision" is best described as:$$,
 $$[
   {"key":"A","text":"Complete loss of sight"},
   {"key":"B","text":"Visual impairment that cannot be fully corrected with ordinary glasses or contacts"},
   {"key":"C","text":"Temporary blurry vision from screen use"},
   {"key":"D","text":"Any diagnosed eye disease"}
 ]$$::jsonb,
 'B',
 $$Low vision refers to significant visual impairment that standard corrective lenses cannot fully fix, but the person still has usable vision.$$),

('CPACC', 'Disabilities, Challenges, and Assistive Technologies',
 $$Refreshable braille displays are most useful to which group?$$,
 $$[
   {"key":"A","text":"Blind users who are proficient in braille"},
   {"key":"B","text":"Deaf users"},
   {"key":"C","text":"Users with low vision who read print"},
   {"key":"D","text":"Users with mobility impairments"}
 ]$$::jsonb,
 'A',
 $$Braille displays render text as tactile braille cells — useful for users fluent in braille, not a universal solution for all blind users.$$),

('CPACC', 'Disabilities, Challenges, and Assistive Technologies',
 $$Which is an example of a situational disability?$$,
 $$[
   {"key":"A","text":"Permanent hearing loss"},
   {"key":"B","text":"Not being able to hear audio in a noisy café"},
   {"key":"C","text":"Congenital blindness"},
   {"key":"D","text":"Quadriplegia"}
 ]$$::jsonb,
 'B',
 $$Situational disabilities are environmental (noisy room, bright sun, one hand holding a baby). They reinforce why accessibility benefits everyone.$$),

-- D2: Accessibility and Universal Design
('CPACC', 'Accessibility and Universal Design',
 $$Which of the following is one of the seven principles of Universal Design?$$,
 $$[
   {"key":"A","text":"Design exclusively for users with disabilities"},
   {"key":"B","text":"Equitable use — useful and marketable to people with diverse abilities"},
   {"key":"C","text":"One-size-fits-all layouts with no options"},
   {"key":"D","text":"Optimize for the average user"}
 ]$$::jsonb,
 'B',
 $$The 7 principles include equitable use, flexibility, simple and intuitive use, perceptible information, tolerance for error, low physical effort, and size/space for approach and use.$$),

('CPACC', 'Accessibility and Universal Design',
 $$What does the POUR acronym stand for in WCAG?$$,
 $$[
   {"key":"A","text":"Perceivable, Operable, Understandable, Robust"},
   {"key":"B","text":"Practical, Open, Useful, Responsive"},
   {"key":"C","text":"Performance, Optimization, Usability, Reliability"},
   {"key":"D","text":"Privacy, Openness, Utility, Readability"}
 ]$$::jsonb,
 'A',
 $$POUR are the four WCAG principles under which all success criteria are organized.$$),

('CPACC', 'Accessibility and Universal Design',
 $$Providing captions for a video primarily supports which POUR principle?$$,
 $$[
   {"key":"A","text":"Operable"},
   {"key":"B","text":"Robust"},
   {"key":"C","text":"Perceivable"},
   {"key":"D","text":"Understandable"}
 ]$$::jsonb,
 'C',
 $$Captions make audio information perceivable to users who cannot hear it.$$),

('CPACC', 'Accessibility and Universal Design',
 $$Ensuring a site works with current and future assistive technologies best aligns with which principle?$$,
 $$[
   {"key":"A","text":"Perceivable"},
   {"key":"B","text":"Robust"},
   {"key":"C","text":"Operable"},
   {"key":"D","text":"Understandable"}
 ]$$::jsonb,
 'B',
 $$Robust means content can be interpreted reliably by a wide variety of user agents, including assistive technologies.$$),

('CPACC', 'Accessibility and Universal Design',
 $$The "curb-cut effect" describes:$$,
 $$[
   {"key":"A","text":"Accessibility features designed for disabled users that also benefit non-disabled users"},
   {"key":"B","text":"A specific WCAG success criterion"},
   {"key":"C","text":"A legal defense against accessibility lawsuits"},
   {"key":"D","text":"An assistive-technology vendor"}
 ]$$::jsonb,
 'A',
 $$Curb cuts were built for wheelchair users but benefit parents with strollers, travelers with luggage, and delivery workers.$$),

('CPACC', 'Accessibility and Universal Design',
 $$A form field whose visible label clearly describes the expected input most directly supports:$$,
 $$[
   {"key":"A","text":"Perceivable only"},
   {"key":"B","text":"Understandable"},
   {"key":"C","text":"Operable only"},
   {"key":"D","text":"Robust only"}
 ]$$::jsonb,
 'B',
 $$Clear labels and instructions help users understand what is expected — the Understandable principle.$$),

-- D3: Standards, Laws, and Management Strategies
('CPACC', 'Standards, Laws, and Management Strategies',
 $$WCAG is published by which organization?$$,
 $$[
   {"key":"A","text":"ISO"},
   {"key":"B","text":"W3C, through the Web Accessibility Initiative (WAI)"},
   {"key":"C","text":"IAAP"},
   {"key":"D","text":"US Access Board"}
 ]$$::jsonb,
 'B',
 $$WCAG (Web Content Accessibility Guidelines) is a W3C Recommendation developed by the WAI.$$),

('CPACC', 'Standards, Laws, and Management Strategies',
 $$Section 508 of the US Rehabilitation Act primarily applies to:$$,
 $$[
   {"key":"A","text":"All private US companies"},
   {"key":"B","text":"US federal agencies and vendors selling ICT to them"},
   {"key":"C","text":"State and local governments only"},
   {"key":"D","text":"European Union institutions"}
 ]$$::jsonb,
 'B',
 $$Section 508 requires federal agencies to make their ICT accessible; vendors typically demonstrate conformance via a VPAT.$$),

('CPACC', 'Standards, Laws, and Management Strategies',
 $$EN 301 549 is the accessibility standard primarily used in:$$,
 $$[
   {"key":"A","text":"United States"},
   {"key":"B","text":"Canada"},
   {"key":"C","text":"European Union"},
   {"key":"D","text":"Japan"}
 ]$$::jsonb,
 'C',
 $$EN 301 549 is the European standard for ICT accessibility, aligned with and extending WCAG.$$),

('CPACC', 'Standards, Laws, and Management Strategies',
 $$In the US, websites have most often been brought under the ADA via:$$,
 $$[
   {"key":"A","text":"Explicit DOJ regulations from 1990"},
   {"key":"B","text":"Case law interpreting Title III ''public accommodations'' to include websites"},
   {"key":"C","text":"Section 508 scoping"},
   {"key":"D","text":"The 21st Century Communications and Video Accessibility Act"}
 ]$$::jsonb,
 'B',
 $$No specific DOJ web regulations have been issued; courts have applied Title III to websites through case law, with circuit splits.$$),

('CPACC', 'Standards, Laws, and Management Strategies',
 $$A VPAT (Voluntary Product Accessibility Template) is used to:$$,
 $$[
   {"key":"A","text":"Report a product''s conformance to accessibility standards"},
   {"key":"B","text":"File an accessibility-related lawsuit"},
   {"key":"C","text":"Generate automated captions"},
   {"key":"D","text":"Train employees on disability awareness"}
 ]$$::jsonb,
 'A',
 $$Vendors publish VPATs (or ACRs) describing how their product conforms to standards like WCAG and Section 508, used in procurement.$$),

('CPACC', 'Standards, Laws, and Management Strategies',
 $$Which approach best embeds accessibility into an organization for the long term?$$,
 $$[
   {"key":"A","text":"A one-time audit before launch"},
   {"key":"B","text":"Automated testing only"},
   {"key":"C","text":"Integrating accessibility throughout the design and development lifecycle"},
   {"key":"D","text":"Responding to complaints as they come in"}
 ]$$::jsonb,
 'C',
 $$Shift-left / lifecycle integration is the most durable strategy — policy, training, design, development, QA, and procurement all participate.$$),

('CPACC', 'Standards, Laws, and Management Strategies',
 $$What is the relationship between WCAG 2.1 and WCAG 2.0?$$,
 $$[
   {"key":"A","text":"WCAG 2.1 replaces 2.0 and removes its criteria"},
   {"key":"B","text":"WCAG 2.1 is backward-compatible — all 2.0 criteria are preserved and new ones are added"},
   {"key":"C","text":"WCAG 2.1 only applies to mobile"},
   {"key":"D","text":"They define conflicting requirements"}
 ]$$::jsonb,
 'B',
 $$WCAG 2.x versions are additive; meeting 2.1 AA necessarily means meeting 2.0 AA.$$),

-- ============================================================
-- WAS
-- ============================================================

-- D1: Create Accessible Web Solutions
('WAS', 'Create Accessible Web Solutions',
 $$What is the correct way to associate a visible label with a form input?$$,
 $$[
   {"key":"A","text":"Place the label text near the input inside a <div>"},
   {"key":"B","text":"Use <label> with a for attribute matching the input''s id, or wrap the input in the <label>"},
   {"key":"C","text":"Use a title attribute on the input"},
   {"key":"D","text":"Use aria-describedby pointing to the label text"}
 ]$$::jsonb,
 'B',
 $$A properly associated <label> is announced by assistive technology and also extends the click target.$$),

('WAS', 'Create Accessible Web Solutions',
 $$When should aria-label be added to a button?$$,
 $$[
   {"key":"A","text":"On every button regardless of visible text"},
   {"key":"B","text":"Only when the button has no visible text, or the visible text is not descriptive enough"},
   {"key":"C","text":"Never — aria-label does not work on buttons"},
   {"key":"D","text":"Only on icons that are decorative"}
 ]$$::jsonb,
 'B',
 $$Prefer visible text; use aria-label to supply an accessible name only when visible text is absent or unclear, and it will override the visible text for AT.$$),

('WAS', 'Create Accessible Web Solutions',
 $$Which heading structure is most accessible for a typical content page?$$,
 $$[
   {"key":"A","text":"Skip levels freely (e.g., h1 followed by h4)"},
   {"key":"B","text":"A single h1 with nested headings that do not skip levels"},
   {"key":"C","text":"Use h1 for every section title"},
   {"key":"D","text":"Use <div class=\"heading\"> for flexibility"}
 ]$$::jsonb,
 'B',
 $$A logical heading hierarchy lets screen reader users navigate the page structure.$$),

('WAS', 'Create Accessible Web Solutions',
 $$A purely decorative image should be coded as:$$,
 $$[
   {"key":"A","text":"<img> with descriptive alt text"},
   {"key":"B","text":"<img alt=\"\"> or a CSS background image"},
   {"key":"C","text":"<img> with the filename as alt"},
   {"key":"D","text":"<img> with role=\"img\""}
 ]$$::jsonb,
 'B',
 $$Empty alt (or CSS background) hides the image from assistive technology so it is not announced as noise.$$),

('WAS', 'Create Accessible Web Solutions',
 $$Under WCAG 2.1 AA, what is the minimum contrast ratio for normal-size body text?$$,
 $$[
   {"key":"A","text":"3:1"},
   {"key":"B","text":"4.5:1"},
   {"key":"C","text":"7:1"},
   {"key":"D","text":"21:1"}
 ]$$::jsonb,
 'B',
 $$4.5:1 for normal text, 3:1 for large text (SC 1.4.3). AAA raises this to 7:1 / 4.5:1.$$),

('WAS', 'Create Accessible Web Solutions',
 $$What is the most accessible approach to building a dropdown?$$,
 $$[
   {"key":"A","text":"Use native <select> whenever the design allows"},
   {"key":"B","text":"Build a custom widget from <div>s with no ARIA"},
   {"key":"C","text":"Use role=\"button\" only"},
   {"key":"D","text":"Put tabindex=\"-1\" on all options"}
 ]$$::jsonb,
 'A',
 $$Native elements come with free keyboard, focus, and AT support. Only reach for a custom ARIA listbox/combobox when the native control cannot meet the design.$$),

-- D2: Identify Web Accessibility Issues
('WAS', 'Identify Web Accessibility Issues',
 $$Which tool is most reliable for detecting missing alt text on images?$$,
 $$[
   {"key":"A","text":"A full manual keyboard walkthrough"},
   {"key":"B","text":"An automated accessibility checker such as axe-core"},
   {"key":"C","text":"A color-contrast analyzer"},
   {"key":"D","text":"A screen reader alone"}
 ]$$::jsonb,
 'B',
 $$Missing alt is easy for automation to detect. Automated tools should be combined with manual and AT testing for full coverage.$$),

('WAS', 'Identify Web Accessibility Issues',
 $$Roughly what percentage of WCAG issues can typical automated tools detect on their own?$$,
 $$[
   {"key":"A","text":"About 5%"},
   {"key":"B","text":"About 30–40%"},
   {"key":"C","text":"About 75%"},
   {"key":"D","text":"100%"}
 ]$$::jsonb,
 'B',
 $$Published studies place automated detection at roughly a third of WCAG failures; the rest requires manual evaluation.$$),

('WAS', 'Identify Web Accessibility Issues',
 $$To confirm a page is fully operable without a mouse you should:$$,
 $$[
   {"key":"A","text":"Trust the axe-core report"},
   {"key":"B","text":"Tab through the page and verify every interactive element is reachable, has a visible focus indicator, and can be activated by keyboard"},
   {"key":"C","text":"Only test with a screen reader"},
   {"key":"D","text":"Check color contrast only"}
 ]$$::jsonb,
 'B',
 $$Keyboard operability is a manual test. Automated tools can flag some issues, but only a real keyboard walk catches focus order, traps, and visibility.$$),

('WAS', 'Identify Web Accessibility Issues',
 $$When testing a form input with a screen reader, the first thing to verify is that it announces:$$,
 $$[
   {"key":"A","text":"A placeholder value"},
   {"key":"B","text":"Its name (label), role, and current state/value"},
   {"key":"C","text":"An aria-hidden=\"true\" attribute"},
   {"key":"D","text":"Inline styles"}
 ]$$::jsonb,
 'B',
 $$The Accessible Name & Description computation and role/state info (the ARIA core) determine whether AT users can understand a control.$$),

('WAS', 'Identify Web Accessibility Issues',
 $$Which WCAG success criterion fails when content becomes unusable at 200% browser zoom?$$,
 $$[
   {"key":"A","text":"1.4.4 Resize Text"},
   {"key":"B","text":"2.4.7 Focus Visible"},
   {"key":"C","text":"3.3.1 Error Identification"},
   {"key":"D","text":"1.3.1 Info and Relationships"}
 ]$$::jsonb,
 'A',
 $$SC 1.4.4 (AA) requires text to be resizable up to 200% without loss of content or functionality.$$),

('WAS', 'Identify Web Accessibility Issues',
 $$A "keyboard trap" occurs when:$$,
 $$[
   {"key":"A","text":"A hidden element receives focus"},
   {"key":"B","text":"Keyboard focus enters a component but cannot be moved away using only the keyboard"},
   {"key":"C","text":"The Tab key does nothing on a page"},
   {"key":"D","text":"A widget cannot be reached with the keyboard at all"}
 ]$$::jsonb,
 'B',
 $$SC 2.1.2 No Keyboard Trap. Common culprits: custom date pickers, embedded players, and dialogs that do not return focus.$$),

-- D3: Remediate Web Accessibility Issues
('WAS', 'Remediate Web Accessibility Issues',
 $$A <div> with an onclick is being used as a button. The best fix is:$$,
 $$[
   {"key":"A","text":"Replace it with a native <button>"},
   {"key":"B","text":"Add style=\"cursor:pointer\" and keep onclick"},
   {"key":"C","text":"Add aria-label only"},
   {"key":"D","text":"Add tabindex=\"-1\""}
 ]$$::jsonb,
 'A',
 $$Native <button> provides correct role, keyboard activation (Enter/Space), and focus behavior for free.$$),

('WAS', 'Remediate Web Accessibility Issues',
 $$When a modal dialog opens, focus should:$$,
 $$[
   {"key":"A","text":"Remain on the triggering element"},
   {"key":"B","text":"Move into the dialog on open and return to the trigger on close"},
   {"key":"C","text":"Move to the page h1"},
   {"key":"D","text":"Be removed from the page entirely"}
 ]$$::jsonb,
 'B',
 $$Move focus in, trap it inside the modal while open, and restore it to the invoking element when the modal closes.$$),

('WAS', 'Remediate Web Accessibility Issues',
 $$An icon-only close button (an ✕) needs:$$,
 $$[
   {"key":"A","text":"No accessible name — sighted users understand it"},
   {"key":"B","text":"An accessible name (e.g., aria-label=\"Close\" or visually hidden text)"},
   {"key":"C","text":"A title=\"Close\" attribute as the only label"},
   {"key":"D","text":"A <span> with onclick"}
 ]$$::jsonb,
 'B',
 $$Every interactive control needs a programmatic accessible name. title alone is unreliable across AT and not keyboard-discoverable.$$),

('WAS', 'Remediate Web Accessibility Issues',
 $$The most robust way to make a form error accessible is to:$$,
 $$[
   {"key":"A","text":"Change the field border color to red"},
   {"key":"B","text":"Associate the error with the field (e.g., aria-describedby) and announce it to assistive tech"},
   {"key":"C","text":"Show the error only in a hover tooltip"},
   {"key":"D","text":"Change the placeholder color"}
 ]$$::jsonb,
 'B',
 $$Color alone fails 1.4.1 Use of Color. A programmatic association plus an announced message satisfies 3.3.1 and 1.3.1.$$),

('WAS', 'Remediate Web Accessibility Issues',
 $$The accessible way to build a data table with row and column headers is:$$,
 $$[
   {"key":"A","text":"A <div> grid styled with CSS"},
   {"key":"B","text":"A <table> using <th> elements (with scope where needed)"},
   {"key":"C","text":"role=\"table\" on a <div>"},
   {"key":"D","text":"aria-label on every cell"}
 ]$$::jsonb,
 'B',
 $$Native table semantics with <th scope> give screen readers the structure they need to announce header context for each cell.$$),

('WAS', 'Remediate Web Accessibility Issues',
 $$Adding aria-live="polite" to a status region:$$,
 $$[
   {"key":"A","text":"Announces updates to screen readers without stealing focus"},
   {"key":"B","text":"Moves keyboard focus into the region"},
   {"key":"C","text":"Hides the region visually"},
   {"key":"D","text":"Replaces the need for semantic markup"}
 ]$$::jsonb,
 'A',
 $$Polite live regions announce at the next graceful opportunity; use assertive sparingly for urgent updates.$$);

-- ============================================================
-- CPACC — additional questions
-- ============================================================

insert into public.questions (exam_type, domain, question, choices, correct_answer, explanation) values

-- D1: Disabilities, Challenges, and Assistive Technologies
('CPACC', 'Disabilities, Challenges, and Assistive Technologies',
 $$A screen magnifier is most directly useful for users with:$$,
 $$[
   {"key":"A","text":"Blindness"},
   {"key":"B","text":"Low vision"},
   {"key":"C","text":"Deafness"},
   {"key":"D","text":"Dyslexia"}
 ]$$::jsonb,
 'B',
 $$Screen magnifiers enlarge a region of the display and often add contrast and cursor enhancements for users with low vision.$$),

('CPACC', 'Disabilities, Challenges, and Assistive Technologies',
 $$Speech recognition / voice input software is most directly a form of assistive technology for:$$,
 $$[
   {"key":"A","text":"Blind users"},
   {"key":"B","text":"Users with motor/dexterity impairments"},
   {"key":"C","text":"Users with color blindness"},
   {"key":"D","text":"Deaf users"}
 ]$$::jsonb,
 'B',
 $$Voice control lets users operate a device hands-free, which is critical for many people with motor impairments (and a mainstream convenience too).$$),

('CPACC', 'Disabilities, Challenges, and Assistive Technologies',
 $$Which is an example of a temporary disability?$$,
 $$[
   {"key":"A","text":"A broken arm in a cast"},
   {"key":"B","text":"Quadriplegia"},
   {"key":"C","text":"Congenital deafness"},
   {"key":"D","text":"Amputation"}
 ]$$::jsonb,
 'A',
 $$Temporary disabilities (injury, recovery from surgery, short-term illness) affect many people at some point and benefit from the same accessibility features as permanent disabilities.$$),

('CPACC', 'Disabilities, Challenges, and Assistive Technologies',
 $$Deuteranopia refers to:$$,
 $$[
   {"key":"A","text":"Total color blindness"},
   {"key":"B","text":"A form of red-green color vision deficiency"},
   {"key":"C","text":"Blue-yellow color vision deficiency"},
   {"key":"D","text":"Progressive vision loss due to aging"}
 ]$$::jsonb,
 'B',
 $$Deuteranopia is a green-deficient red-green color vision deficiency. Protanopia is the red-deficient type; tritanopia is blue-yellow.$$),

('CPACC', 'Disabilities, Challenges, and Assistive Technologies',
 $$Which statement about cognitive disabilities is most accurate?$$,
 $$[
   {"key":"A","text":"They are all visible and easy to identify"},
   {"key":"B","text":"They are a diverse group including learning, memory, attention, and processing differences"},
   {"key":"C","text":"They only affect children"},
   {"key":"D","text":"They are the same as mental illness"}
 ]$$::jsonb,
 'B',
 $$Cognitive disabilities span learning disabilities (dyslexia, dyscalculia), ADHD, autism, memory impairment, traumatic brain injury, and more.$$),

('CPACC', 'Disabilities, Challenges, and Assistive Technologies',
 $$The social model of disability holds that:$$,
 $$[
   {"key":"A","text":"Disability is caused solely by a medical condition in the individual"},
   {"key":"B","text":"Disability results from the interaction between individuals and a society/environment that excludes them"},
   {"key":"C","text":"Disability is always temporary"},
   {"key":"D","text":"Disability is a purely legal construct"}
 ]$$::jsonb,
 'B',
 $$Contrast with the medical model. The social model shifts responsibility from the person to the environment — a framing that underpins accessibility work.$$),

('CPACC', 'Disabilities, Challenges, and Assistive Technologies',
 $$Sip-and-puff input devices are primarily used by:$$,
 $$[
   {"key":"A","text":"Users who are deaf"},
   {"key":"B","text":"Users with severe motor impairments such as high-level spinal cord injury"},
   {"key":"C","text":"Users with mild dyslexia"},
   {"key":"D","text":"Users with color blindness"}
 ]$$::jsonb,
 'B',
 $$Sip-and-puff devices translate breath pressure into switch or mouse input for users who cannot use their limbs.$$),

('CPACC', 'Disabilities, Challenges, and Assistive Technologies',
 $$CART (Communication Access Real-time Translation) most directly assists:$$,
 $$[
   {"key":"A","text":"Blind users reading long documents"},
   {"key":"B","text":"Deaf or hard-of-hearing users consuming live spoken content"},
   {"key":"C","text":"Users with motor impairments"},
   {"key":"D","text":"Users with photosensitive epilepsy"}
 ]$$::jsonb,
 'B',
 $$A stenographer produces real-time verbatim text of spoken content, often used at conferences, classrooms, and meetings.$$),

('CPACC', 'Disabilities, Challenges, and Assistive Technologies',
 $$A "print disability" includes which of the following?$$,
 $$[
   {"key":"A","text":"Only blindness"},
   {"key":"B","text":"Conditions that prevent reading standard print — including blindness, low vision, dyslexia, and some motor impairments"},
   {"key":"C","text":"Only dyslexia"},
   {"key":"D","text":"Only people who cannot hold a book"}
 ]$$::jsonb,
 'B',
 $$Print disability is a broad term covering anyone who cannot read standard print effectively, used in copyright and library-access laws (e.g., Marrakesh Treaty).$$),

('CPACC', 'Disabilities, Challenges, and Assistive Technologies',
 $$Photosensitive epilepsy is most relevant to which type of content risk?$$,
 $$[
   {"key":"A","text":"Low-contrast text"},
   {"key":"B","text":"Rapidly flashing content (more than 3 flashes per second)"},
   {"key":"C","text":"Missing captions"},
   {"key":"D","text":"Complex navigation menus"}
 ]$$::jsonb,
 'B',
 $$WCAG 2.3.1 limits flashing to under 3 times per second (with size/contrast exceptions) to avoid triggering seizures.$$),

('CPACC', 'Disabilities, Challenges, and Assistive Technologies',
 $$Aphasia is a condition that primarily affects:$$,
 $$[
   {"key":"A","text":"Vision"},
   {"key":"B","text":"Language production or comprehension, often after a stroke"},
   {"key":"C","text":"Fine motor control only"},
   {"key":"D","text":"Balance and mobility"}
 ]$$::jsonb,
 'B',
 $$Aphasia affects the ability to process language — reading, writing, speaking, or understanding — and benefits from plain-language content.$$),

('CPACC', 'Disabilities, Challenges, and Assistive Technologies',
 $$Which of these is an example of a "perceptual" or sensory disability?$$,
 $$[
   {"key":"A","text":"Blindness"},
   {"key":"B","text":"Dyscalculia"},
   {"key":"C","text":"Paraplegia"},
   {"key":"D","text":"Anxiety disorder"}
 ]$$::jsonb,
 'A',
 $$Sensory/perceptual disabilities affect how information is received — vision and hearing being the primary examples in accessibility.$$),

('CPACC', 'Disabilities, Challenges, and Assistive Technologies',
 $$An alternative keyboard with large, well-spaced keys most directly addresses:$$,
 $$[
   {"key":"A","text":"Hearing loss"},
   {"key":"B","text":"Fine-motor difficulties or tremors"},
   {"key":"C","text":"Color blindness"},
   {"key":"D","text":"Photosensitivity"}
 ]$$::jsonb,
 'B',
 $$Large, widely-spaced keys reduce mis-strikes for users with limited dexterity, tremors, or conditions like Parkinson''s disease.$$),

('CPACC', 'Disabilities, Challenges, and Assistive Technologies',
 $$Which pairing best matches disability to commonly used assistive technology?$$,
 $$[
   {"key":"A","text":"Deafness → screen reader"},
   {"key":"B","text":"Blindness → captions"},
   {"key":"C","text":"Motor impairment → switch access or voice input"},
   {"key":"D","text":"Color blindness → braille display"}
 ]$$::jsonb,
 'C',
 $$Know the basic mappings: blind → screen reader/braille; low vision → magnifier; deaf → captions/sign interpretation; motor → switch/voice/alt keyboards.$$),

('CPACC', 'Disabilities, Challenges, and Assistive Technologies',
 $$The WHO''s ICF (International Classification of Functioning, Disability and Health) frames disability as:$$,
 $$[
   {"key":"A","text":"A purely medical diagnosis"},
   {"key":"B","text":"An interaction between body function/structure, activities, participation, and environmental/personal factors"},
   {"key":"C","text":"A social construction with no biological component"},
   {"key":"D","text":"A workplace accommodation category"}
 ]$$::jsonb,
 'B',
 $$The ICF is a biopsychosocial model — it explicitly integrates body function, activity, participation, and environmental context.$$),

('CPACC', 'Disabilities, Challenges, and Assistive Technologies',
 $$Deaf-blind users often rely on which AT?$$,
 $$[
   {"key":"A","text":"Screen magnifiers"},
   {"key":"B","text":"Refreshable braille displays paired with a screen reader"},
   {"key":"C","text":"Closed captions only"},
   {"key":"D","text":"High-contrast themes"}
 ]$$::jsonb,
 'B',
 $$With no usable sight or hearing, tactile output (braille) is often the only channel — which makes proper semantic HTML essential.$$),

('CPACC', 'Disabilities, Challenges, and Assistive Technologies',
 $$Autism spectrum users may benefit most from:$$,
 $$[
   {"key":"A","text":"Consistent, predictable interfaces and reduced sensory overload"},
   {"key":"B","text":"Auto-playing video with bright flashing animations"},
   {"key":"C","text":"Surprise context changes"},
   {"key":"D","text":"Dense walls of unstructured text"}
 ]$$::jsonb,
 'A',
 $$Predictability, plain language, clear structure, and user control over motion/sound support autistic users (and broadly improve UX).$$),

('CPACC', 'Disabilities, Challenges, and Assistive Technologies',
 $$Age-related macular degeneration most commonly affects:$$,
 $$[
   {"key":"A","text":"Peripheral vision, leaving central vision intact"},
   {"key":"B","text":"Central vision, making reading and recognizing faces difficult"},
   {"key":"C","text":"Color perception only"},
   {"key":"D","text":"Night vision only"}
 ]$$::jsonb,
 'B',
 $$AMD damages the macula, which is responsible for sharp central vision — a leading cause of low vision among older adults.$$),

('CPACC', 'Disabilities, Challenges, and Assistive Technologies',
 $$Which of these is NOT typically a sensory disability?$$,
 $$[
   {"key":"A","text":"Blindness"},
   {"key":"B","text":"Deafness"},
   {"key":"C","text":"Low vision"},
   {"key":"D","text":"Rheumatoid arthritis"}
 ]$$::jsonb,
 'D',
 $$Arthritis is a physical/motor condition — not sensory. Blindness, low vision, and deafness affect sight and hearing.$$),

('CPACC', 'Disabilities, Challenges, and Assistive Technologies',
 $$Dyscalculia is a learning disability that primarily affects:$$,
 $$[
   {"key":"A","text":"Reading fluency"},
   {"key":"B","text":"Number sense and mathematical reasoning"},
   {"key":"C","text":"Spelling"},
   {"key":"D","text":"Spatial navigation"}
 ]$$::jsonb,
 'B',
 $$Dyscalculia is to math what dyslexia is to reading. Affected users benefit from clear visual representations of quantity and structured problem steps.$$),

-- D2: Accessibility and Universal Design
('CPACC', 'Accessibility and Universal Design',
 $$The Universal Design principle "Flexibility in Use" means:$$,
 $$[
   {"key":"A","text":"The design accommodates a wide range of individual preferences and abilities"},
   {"key":"B","text":"The design has one fixed way to be used"},
   {"key":"C","text":"The design is cheap to produce"},
   {"key":"D","text":"The design is only for disabled users"}
 ]$$::jsonb,
 'A',
 $$Principle 2: flexibility includes choice in methods of use, accommodating right/left-handed use, and adaptability to user pace.$$),

('CPACC', 'Accessibility and Universal Design',
 $$"Simple and Intuitive Use" as a UD principle requires that:$$,
 $$[
   {"key":"A","text":"Only experts can operate the design"},
   {"key":"B","text":"Use of the design is easy to understand regardless of experience, knowledge, language skills, or concentration level"},
   {"key":"C","text":"The design looks minimalist"},
   {"key":"D","text":"Instructions must be memorized"}
 ]$$::jsonb,
 'B',
 $$Principle 3: eliminate unnecessary complexity and accommodate a wide range of literacy, language, and cognitive abilities.$$),

('CPACC', 'Accessibility and Universal Design',
 $$"Tolerance for Error" in Universal Design means:$$,
 $$[
   {"key":"A","text":"Errors are impossible"},
   {"key":"B","text":"The design minimizes hazards and adverse consequences of accidental or unintended actions"},
   {"key":"C","text":"Users who make errors are penalized"},
   {"key":"D","text":"Error messages are hidden"}
 ]$$::jsonb,
 'B',
 $$Principle 5: confirmation for irreversible actions, undo, warnings, and fail-safe defaults all support this principle.$$),

('CPACC', 'Accessibility and Universal Design',
 $$The highest level of WCAG conformance is:$$,
 $$[
   {"key":"A","text":"Level A"},
   {"key":"B","text":"Level AA"},
   {"key":"C","text":"Level AAA"},
   {"key":"D","text":"Level X"}
 ]$$::jsonb,
 'C',
 $$A, AA, AAA from most basic to most strict. Most laws and procurement target AA as a practical benchmark; AAA is not required site-wide.$$),

('CPACC', 'Accessibility and Universal Design',
 $$Most accessibility laws and standards reference which WCAG level as the target?$$,
 $$[
   {"key":"A","text":"Level A"},
   {"key":"B","text":"Level AA"},
   {"key":"C","text":"Level AAA"},
   {"key":"D","text":"No level — all success criteria"}
 ]$$::jsonb,
 'B',
 $$Level AA is the de facto legal benchmark (ADA settlements, EN 301 549, Section 508 Refresh, AODA, etc.).$$),

('CPACC', 'Accessibility and Universal Design',
 $$Providing text alternatives for non-text content maps primarily to which POUR principle?$$,
 $$[
   {"key":"A","text":"Perceivable"},
   {"key":"B","text":"Operable"},
   {"key":"C","text":"Understandable"},
   {"key":"D","text":"Robust"}
 ]$$::jsonb,
 'A',
 $$Text alternatives let users who cannot perceive the original form (e.g., an image) receive the information in another form (speech, braille, enlarged text).$$),

('CPACC', 'Accessibility and Universal Design',
 $$A site that requires precise drag-and-drop with no keyboard alternative primarily violates which POUR principle?$$,
 $$[
   {"key":"A","text":"Perceivable"},
   {"key":"B","text":"Operable"},
   {"key":"C","text":"Understandable"},
   {"key":"D","text":"Robust"}
 ]$$::jsonb,
 'B',
 $$Operable requires content to be operable through various input methods — keyboard accessibility is core (SC 2.1.1).$$),

('CPACC', 'Accessibility and Universal Design',
 $$Inclusive design is best described as:$$,
 $$[
   {"key":"A","text":"The same as universal design with a different name"},
   {"key":"B","text":"A methodology that designs with and for people who have a range of perspectives, often iterating with diverse users"},
   {"key":"C","text":"A legal framework"},
   {"key":"D","text":"A branding term with no substance"}
 ]$$::jsonb,
 'B',
 $$Inclusive design tends to emphasize process and diverse participation; universal design emphasizes product/environment principles. They overlap.$$),

('CPACC', 'Accessibility and Universal Design',
 $$Designing a button to be at least 24×24 CSS pixels (per WCAG 2.5.8) most directly supports which UD principle?$$,
 $$[
   {"key":"A","text":"Equitable Use"},
   {"key":"B","text":"Size and Space for Approach and Use"},
   {"key":"C","text":"Perceptible Information"},
   {"key":"D","text":"Low Physical Effort"}
 ]$$::jsonb,
 'B',
 $$Principle 7 ensures appropriate size and space for approach, reach, manipulation, and use — mirrored by target-size criteria in WCAG.$$),

('CPACC', 'Accessibility and Universal Design',
 $$Auto-advancing content with no way to pause primarily fails which POUR principle?$$,
 $$[
   {"key":"A","text":"Perceivable"},
   {"key":"B","text":"Operable"},
   {"key":"C","text":"Understandable"},
   {"key":"D","text":"Robust"}
 ]$$::jsonb,
 'B',
 $$SC 2.2.2 Pause, Stop, Hide: users must be able to pause moving/auto-updating content. This is under the Operable principle.$$),

('CPACC', 'Accessibility and Universal Design',
 $$Using plain language on a public-facing site primarily supports:$$,
 $$[
   {"key":"A","text":"Only users with cognitive disabilities"},
   {"key":"B","text":"A wide range of users including those with cognitive disabilities, non-native speakers, and readers in a hurry"},
   {"key":"C","text":"Only machine translation"},
   {"key":"D","text":"Only SEO"}
 ]$$::jsonb,
 'B',
 $$Plain language is a classic curb-cut: designed for cognitive/language needs, benefits nearly everyone.$$),

('CPACC', 'Accessibility and Universal Design',
 $$"Perceptible Information" (UD principle 4) is best illustrated by:$$,
 $$[
   {"key":"A","text":"A sign that uses color alone to convey meaning"},
   {"key":"B","text":"An alert that uses sound, light, and text simultaneously"},
   {"key":"C","text":"A text-only manual with no illustrations"},
   {"key":"D","text":"A button with no label"}
 ]$$::jsonb,
 'B',
 $$Perceptible Information calls for redundant presentation of essential info in different sensory modes.$$),

('CPACC', 'Accessibility and Universal Design',
 $$An interactive element that behaves differently on hover vs focus (e.g., only shows on mouse hover) fails to serve:$$,
 $$[
   {"key":"A","text":"Only blind users"},
   {"key":"B","text":"Keyboard users and touch users"},
   {"key":"C","text":"Only color-blind users"},
   {"key":"D","text":"Users on fast connections"}
 ]$$::jsonb,
 'B',
 $$Hover-only content is inaccessible to keyboard users and unreliable on touch. Parity between hover and focus is a UD requirement.$$),

('CPACC', 'Accessibility and Universal Design',
 $$"Consistent navigation" across a site primarily supports which POUR principle?$$,
 $$[
   {"key":"A","text":"Perceivable"},
   {"key":"B","text":"Operable"},
   {"key":"C","text":"Understandable"},
   {"key":"D","text":"Robust"}
 ]$$::jsonb,
 'C',
 $$SC 3.2.3 Consistent Navigation lives under Understandable: users form mental models faster when structures repeat predictably.$$),

('CPACC', 'Accessibility and Universal Design',
 $$A WCAG success criterion is:$$,
 $$[
   {"key":"A","text":"A suggested technique for meeting an accessibility goal"},
   {"key":"B","text":"A testable, technology-agnostic statement that content must satisfy at a given conformance level"},
   {"key":"C","text":"An optional best practice"},
   {"key":"D","text":"The name of an automated tool"}
 ]$$::jsonb,
 'B',
 $$Success criteria are the normative requirements. Techniques are non-normative ways of meeting them (sufficient, advisory, or failure).$$),

('CPACC', 'Accessibility and Universal Design',
 $$Which is NOT one of the four POUR principles?$$,
 $$[
   {"key":"A","text":"Perceivable"},
   {"key":"B","text":"Operable"},
   {"key":"C","text":"Responsive"},
   {"key":"D","text":"Robust"}
 ]$$::jsonb,
 'C',
 $$POUR = Perceivable, Operable, Understandable, Robust. "Responsive" is a web-design concept, not a WCAG principle.$$),

('CPACC', 'Accessibility and Universal Design',
 $$"Accessibility supported" in WCAG means:$$,
 $$[
   {"key":"A","text":"The technique uses HTML5"},
   {"key":"B","text":"The way the content is used must be supported by users'' assistive technologies and relevant user agents"},
   {"key":"C","text":"The site is certified by IAAP"},
   {"key":"D","text":"The site passed axe-core"}
 ]$$::jsonb,
 'B',
 $$WCAG conformance requires using technologies in an accessibility-supported way — i.e., actually working with real AT in real user agents.$$),

('CPACC', 'Accessibility and Universal Design',
 $$Which is true about WCAG 2.2 compared to 2.1?$$,
 $$[
   {"key":"A","text":"2.2 removes several existing criteria"},
   {"key":"B","text":"2.2 is backward-compatible and adds new success criteria (e.g., Focus Not Obscured, Target Size Minimum)"},
   {"key":"C","text":"2.2 only applies to PDF"},
   {"key":"D","text":"2.2 replaces POUR with a new structure"}
 ]$$::jsonb,
 'B',
 $$Like 2.1 before it, 2.2 is additive. (Note: 4.1.1 Parsing was deprecated in 2.2, but no new criteria were removed.)$$),

('CPACC', 'Accessibility and Universal Design',
 $$"Enough Time" (WCAG guideline 2.2) addresses:$$,
 $$[
   {"key":"A","text":"Page load performance"},
   {"key":"B","text":"Giving users enough time to read and interact with content (e.g., adjustable/extendable time limits)"},
   {"key":"C","text":"Server response time"},
   {"key":"D","text":"Animation duration only"}
 ]$$::jsonb,
 'B',
 $$Users with cognitive, motor, or reading disabilities often need more time — this guideline requires the ability to turn off, adjust, or extend time limits.$$),

-- D3: Standards, Laws, and Management Strategies
('CPACC', 'Standards, Laws, and Management Strategies',
 $$Ontario''s AODA (Accessibility for Ontarians with Disabilities Act) primarily requires:$$,
 $$[
   {"key":"A","text":"Only public-sector compliance, with no private-sector scope"},
   {"key":"B","text":"Ontario organizations meeting accessibility standards, including WCAG 2.0 AA for public websites and web content"},
   {"key":"C","text":"US federal agency conformance"},
   {"key":"D","text":"EU member-state adoption"}
 ]$$::jsonb,
 'B',
 $$AODA covers Ontario public- and private-sector organizations. Its IASR includes WCAG-based web requirements.$$),

('CPACC', 'Standards, Laws, and Management Strategies',
 $$The Accessible Canada Act applies to:$$,
 $$[
   {"key":"A","text":"All Canadian organizations"},
   {"key":"B","text":"Federally regulated entities in Canada (e.g., federal agencies, banks, telecom, transport)"},
   {"key":"C","text":"Only Quebec"},
   {"key":"D","text":"Only provincial governments"}
 ]$$::jsonb,
 'B',
 $$The ACA (2019) targets federally regulated organizations; provinces have their own laws (e.g., AODA in Ontario).$$),

('CPACC', 'Standards, Laws, and Management Strategies',
 $$The UN Convention on the Rights of Persons with Disabilities (CRPD) is:$$,
 $$[
   {"key":"A","text":"An international treaty affirming the rights of persons with disabilities, including access to ICT"},
   {"key":"B","text":"A US federal law"},
   {"key":"C","text":"A W3C Recommendation"},
   {"key":"D","text":"An IAAP certification"}
 ]$$::jsonb,
 'A',
 $$The CRPD (2006) has been ratified by most UN members and is the international human-rights basis for accessibility obligations, including Article 9 on accessibility.$$),

('CPACC', 'Standards, Laws, and Management Strategies',
 $$Title I of the ADA primarily addresses:$$,
 $$[
   {"key":"A","text":"Public accommodations (businesses open to the public)"},
   {"key":"B","text":"Employment — reasonable accommodations by employers with 15+ employees"},
   {"key":"C","text":"State and local government services"},
   {"key":"D","text":"Telecommunications"}
 ]$$::jsonb,
 'B',
 $$ADA Title I covers employment. Title II is state/local government; Title III is public accommodations; Title IV is telecom.$$),

('CPACC', 'Standards, Laws, and Management Strategies',
 $$An "accessibility overlay" (a third-party widget promising instant compliance) is generally considered:$$,
 $$[
   {"key":"A","text":"A complete substitute for accessible design"},
   {"key":"B","text":"Unable to make a non-accessible site fully conformant on its own, and often problematic"},
   {"key":"C","text":"Legally sufficient for ADA compliance"},
   {"key":"D","text":"The accessibility industry''s preferred solution"}
 ]$$::jsonb,
 'B',
 $$Major advocacy organizations and accessibility professionals have warned against overlays — they do not fix underlying issues and can create new barriers.$$),

('CPACC', 'Standards, Laws, and Management Strategies',
 $$A published accessibility statement on a website typically does which of the following?$$,
 $$[
   {"key":"A","text":"Declares conformance goals, known issues, and contact channels for accessibility feedback"},
   {"key":"B","text":"Guarantees legal immunity"},
   {"key":"C","text":"Replaces the need to actually be accessible"},
   {"key":"D","text":"Is prohibited under WCAG"}
 ]$$::jsonb,
 'A',
 $$Statements set expectations and give users a way to report barriers. Some jurisdictions (EU Web Accessibility Directive) require them.$$),

('CPACC', 'Standards, Laws, and Management Strategies',
 $$Procurement teams typically require vendors to produce which artifact to demonstrate accessibility claims?$$,
 $$[
   {"key":"A","text":"A VPAT / Accessibility Conformance Report (ACR)"},
   {"key":"B","text":"A SOC 2 report"},
   {"key":"C","text":"A GDPR DPA"},
   {"key":"D","text":"An NDA"}
 ]$$::jsonb,
 'A',
 $$The VPAT (often filled in to produce an ACR) is the standard industry format for reporting conformance with WCAG, Section 508, and EN 301 549.$$),

('CPACC', 'Standards, Laws, and Management Strategies',
 $$Which is most characteristic of a mature accessibility management program?$$,
 $$[
   {"key":"A","text":"Documented policy, training, procurement requirements, testing, and executive sponsorship"},
   {"key":"B","text":"One passionate advocate fixing issues ad hoc"},
   {"key":"C","text":"Annual third-party audits as the sole control"},
   {"key":"D","text":"Relying entirely on user complaints"}
 ]$$::jsonb,
 'A',
 $$Mature programs operationalize accessibility across roles and lifecycle phases — people, process, and tooling — not a single individual or event.$$),

('CPACC', 'Standards, Laws, and Management Strategies',
 $$The European Accessibility Act (EAA) primarily targets:$$,
 $$[
   {"key":"A","text":"Accessibility of specified products and services placed on the EU market (e.g., ecommerce, banking, e-books)"},
   {"key":"B","text":"Only public-sector websites"},
   {"key":"C","text":"Only employment discrimination"},
   {"key":"D","text":"Only physical building accessibility"}
 ]$$::jsonb,
 'A',
 $$The EAA expands EU accessibility obligations into the private sector for a defined scope of products and services, with enforcement beginning in 2025.$$),

('CPACC', 'Standards, Laws, and Management Strategies',
 $$Which best describes "shift left" in an accessibility program?$$,
 $$[
   {"key":"A","text":"Moving accessibility work earlier in the product lifecycle — into research, design, and planning"},
   {"key":"B","text":"Only running tests in staging"},
   {"key":"C","text":"Outsourcing all testing"},
   {"key":"D","text":"Fixing bugs only after launch"}
 ]$$::jsonb,
 'A',
 $$Addressing accessibility early (design reviews, acceptance criteria, component libraries) is cheaper and more effective than late remediation.$$);

-- ============================================================
-- WAS — additional questions
-- ============================================================

insert into public.questions (exam_type, domain, question, choices, correct_answer, explanation) values

-- D1: Create Accessible Web Solutions
('WAS', 'Create Accessible Web Solutions',
 $$A "skip to main content" link should:$$,
 $$[
   {"key":"A","text":"Only appear for screen-reader users"},
   {"key":"B","text":"Be the first focusable element on the page and become visible on focus"},
   {"key":"C","text":"Be hidden at all times"},
   {"key":"D","text":"Open in a new tab"}
 ]$$::jsonb,
 'B',
 $$Skip links let keyboard users bypass repeated navigation (SC 2.4.1). They can be visually hidden by default but must be visible when focused.$$),

('WAS', 'Create Accessible Web Solutions',
 $$Which HTML element most clearly identifies the primary content region of a page?$$,
 $$[
   {"key":"A","text":"<div id=\"main\">"},
   {"key":"B","text":"<main>"},
   {"key":"C","text":"<section class=\"content\">"},
   {"key":"D","text":"<article>"}
 ]$$::jsonb,
 'B',
 $$<main> provides the main landmark role. It should appear once per page and hold the unique content.$$),

('WAS', 'Create Accessible Web Solutions',
 $$Setting the lang attribute on the <html> element primarily:$$,
 $$[
   {"key":"A","text":"Changes the visual font"},
   {"key":"B","text":"Lets screen readers and translation tools pronounce and interpret content correctly"},
   {"key":"C","text":"Enables dark mode"},
   {"key":"D","text":"Improves page rank"}
 ]$$::jsonb,
 'B',
 $$SC 3.1.1 Language of Page. Screen readers use lang to pick the correct pronunciation rules.$$),

('WAS', 'Create Accessible Web Solutions',
 $$For a foreign-language phrase inline in an English page, you should:$$,
 $$[
   {"key":"A","text":"Ignore it — the page lang is enough"},
   {"key":"B","text":"Wrap it in a span with its own lang attribute"},
   {"key":"C","text":"Translate it automatically"},
   {"key":"D","text":"Put it in an image"}
 ]$$::jsonb,
 'B',
 $$SC 3.1.2 Language of Parts. The inner lang attribute tells AT to switch pronunciation for that passage.$$),

('WAS', 'Create Accessible Web Solutions',
 $$A group of related radio buttons should be wrapped in:$$,
 $$[
   {"key":"A","text":"A <div> with role=\"group\""},
   {"key":"B","text":"<fieldset> with a <legend> describing the group"},
   {"key":"C","text":"<section> with aria-label"},
   {"key":"D","text":"No wrapper — each radio stands alone"}
 ]$$::jsonb,
 'B',
 $$fieldset/legend is the native pattern — screen readers announce the legend as context for each radio.$$),

('WAS', 'Create Accessible Web Solutions',
 $$Which attribute programmatically indicates the expected data type for an input (e.g., email, phone), helping 1.3.5 Identify Input Purpose?$$,
 $$[
   {"key":"A","text":"placeholder"},
   {"key":"B","text":"autocomplete"},
   {"key":"C","text":"title"},
   {"key":"D","text":"data-type"}
 ]$$::jsonb,
 'B',
 $$The HTML autocomplete attribute (e.g., email, tel, given-name) satisfies SC 1.3.5 and helps users with cognitive disabilities autofill forms.$$),

('WAS', 'Create Accessible Web Solutions',
 $$When a modal dialog opens, which ARIA attributes are most important?$$,
 $$[
   {"key":"A","text":"role=\"dialog\", aria-modal=\"true\", and an accessible name (aria-labelledby or aria-label)"},
   {"key":"B","text":"Only aria-hidden=\"true\""},
   {"key":"C","text":"role=\"region\" alone"},
   {"key":"D","text":"No ARIA — a styled <div> is enough"}
 ]$$::jsonb,
 'A',
 $$Dialogs need a role, modal state, accessible name, focus management, and Esc-to-close behavior.$$),

('WAS', 'Create Accessible Web Solutions',
 $$Which is the most accessible way to convey "required" on a form field?$$,
 $$[
   {"key":"A","text":"A red asterisk only in the label"},
   {"key":"B","text":"The required attribute plus a visible indication (e.g., asterisk with a legend explaining it, or the word ''required'')"},
   {"key":"C","text":"Rely on browser validation only"},
   {"key":"D","text":"Placeholder text saying ''required''"}
 ]$$::jsonb,
 'B',
 $$Use programmatic state (required / aria-required) plus a visible, non-color-only cue so all users perceive the requirement.$$),

('WAS', 'Create Accessible Web Solutions',
 $$aria-expanded on a disclosure button should:$$,
 $$[
   {"key":"A","text":"Be set once at page load"},
   {"key":"B","text":"Toggle between ''true'' and ''false'' to reflect whether the controlled region is open"},
   {"key":"C","text":"Always be true"},
   {"key":"D","text":"Be replaced by aria-hidden"}
 ]$$::jsonb,
 'B',
 $$aria-expanded communicates the current state to AT; it must update when the user toggles the disclosure.$$),

('WAS', 'Create Accessible Web Solutions',
 $$Using tabindex="0" on a custom element:$$,
 $$[
   {"key":"A","text":"Removes it from the tab order"},
   {"key":"B","text":"Places it into the normal tab order at its document position"},
   {"key":"C","text":"Makes it the first focusable element"},
   {"key":"D","text":"Gives it implicit button semantics"}
 ]$$::jsonb,
 'B',
 $$tabindex="0" lets non-focusable elements receive keyboard focus in source order. Remember: focus alone does not add role or keyboard behavior.$$),

('WAS', 'Create Accessible Web Solutions',
 $$tabindex values greater than 0 are generally:$$,
 $$[
   {"key":"A","text":"Recommended for keyboard accessibility"},
   {"key":"B","text":"An anti-pattern — they override natural tab order and cause confusion"},
   {"key":"C","text":"Required for ARIA widgets"},
   {"key":"D","text":"Ignored by browsers"}
 ]$$::jsonb,
 'B',
 $$Positive tabindex creates fragile, surprising focus orders and usually signals that the DOM order should be fixed instead.$$),

('WAS', 'Create Accessible Web Solutions',
 $$A <nav> element should:$$,
 $$[
   {"key":"A","text":"Appear exactly once per page"},
   {"key":"B","text":"Be used for major sets of navigation links, and labeled if multiple <nav> elements exist"},
   {"key":"C","text":"Never be used inside a <header>"},
   {"key":"D","text":"Replace <ul>"}
 ]$$::jsonb,
 'B',
 $$Multiple navs are fine (e.g., primary, footer, breadcrumbs). Use aria-label / aria-labelledby to distinguish them.$$),

('WAS', 'Create Accessible Web Solutions',
 $$An <a> element used as a button (i.e., it performs an in-page action rather than navigating) should be:$$,
 $$[
   {"key":"A","text":"Left as is — <a> works fine"},
   {"key":"B","text":"Changed to a <button>, since <button> has the correct role and keyboard semantics"},
   {"key":"C","text":"Styled with cursor:pointer"},
   {"key":"D","text":"Given role=\"link\""}
 ]$$::jsonb,
 'B',
 $$Links navigate; buttons act. <a> without href is not focusable/operable by default, and <button> brings Space/Enter activation for free.$$),

('WAS', 'Create Accessible Web Solutions',
 $$role="presentation" (or role="none") on an element:$$,
 $$[
   {"key":"A","text":"Hides it from sighted users"},
   {"key":"B","text":"Strips its implicit ARIA semantics while keeping children accessible"},
   {"key":"C","text":"Removes it from the DOM"},
   {"key":"D","text":"Prevents keyboard focus"}
 ]$$::jsonb,
 'B',
 $$Useful when layout tables or decorative structures should not be announced as tables/lists. Does not hide the element — only removes semantics.$$),

('WAS', 'Create Accessible Web Solutions',
 $$The accessible name of a button is computed primarily from:$$,
 $$[
   {"key":"A","text":"CSS content"},
   {"key":"B","text":"aria-labelledby, then aria-label, then text content, then title (with defined fallback order)"},
   {"key":"C","text":"The src attribute"},
   {"key":"D","text":"The placeholder"}
 ]$$::jsonb,
 'B',
 $$ARIA name computation has a defined precedence — know the chain. Title is a last resort and unreliable on touch and for many AT.$$),

('WAS', 'Create Accessible Web Solutions',
 $$For a long-form input description that must be announced by screen readers but shown only on focus, use:$$,
 $$[
   {"key":"A","text":"placeholder"},
   {"key":"B","text":"aria-describedby pointing to a visible or visually-hidden element"},
   {"key":"C","text":"title"},
   {"key":"D","text":"alt"}
 ]$$::jsonb,
 'B',
 $$aria-describedby provides supplementary information that is announced after the name/role and can be shown visually as helper text.$$),

('WAS', 'Create Accessible Web Solutions',
 $$Auto-playing video with sound longer than 3 seconds:$$,
 $$[
   {"key":"A","text":"Is always allowed"},
   {"key":"B","text":"Must provide a way to pause, stop, or mute (SC 1.4.2 Audio Control)"},
   {"key":"C","text":"Is recommended for engagement"},
   {"key":"D","text":"Only fails WCAG at AAA"}
 ]$$::jsonb,
 'B',
 $$SC 1.4.2 (Level A) requires a mechanism to control audio that plays automatically for more than 3 seconds.$$),

('WAS', 'Create Accessible Web Solutions',
 $$Which pattern best supports screen-reader users consuming breaking news updates without stealing focus?$$,
 $$[
   {"key":"A","text":"A modal dialog"},
   {"key":"B","text":"An ARIA live region (e.g., role=\"status\" or aria-live=\"polite\")"},
   {"key":"C","text":"A page reload"},
   {"key":"D","text":"aria-hidden=\"true\""}
 ]$$::jsonb,
 'B',
 $$Live regions announce updates without moving focus. role=\"status\" implies aria-live=\"polite\".$$),

('WAS', 'Create Accessible Web Solutions',
 $$When building a custom ARIA tabs widget, arrow keys should:$$,
 $$[
   {"key":"A","text":"Do nothing — only Tab is needed"},
   {"key":"B","text":"Move between tabs (with Home/End optionally), per the WAI-ARIA Authoring Practices"},
   {"key":"C","text":"Submit the form"},
   {"key":"D","text":"Open a context menu"}
 ]$$::jsonb,
 'B',
 $$Tabs use roving tabindex + arrow-key navigation; Tab moves focus into/out of the tablist.$$),

('WAS', 'Create Accessible Web Solutions',
 $$The accessible way to hide content visually while keeping it available to screen readers is:$$,
 $$[
   {"key":"A","text":"display:none"},
   {"key":"B","text":"A visually-hidden utility class (clip-path, position:absolute, 1px size, overflow:hidden)"},
   {"key":"C","text":"visibility:hidden"},
   {"key":"D","text":"opacity:0"}
 ]$$::jsonb,
 'B',
 $$display:none / visibility:hidden also hide from AT. The classic "sr-only" pattern keeps content in the accessibility tree.$$),

-- D2: Identify Web Accessibility Issues
('WAS', 'Identify Web Accessibility Issues',
 $$The most thorough way to evaluate keyboard accessibility is:$$,
 $$[
   {"key":"A","text":"Running axe-core"},
   {"key":"B","text":"Manually tabbing through the page with no mouse, verifying focus order, visibility, and activation of every interactive element"},
   {"key":"C","text":"Checking color contrast"},
   {"key":"D","text":"Reading the HTML source"}
 ]$$::jsonb,
 'B',
 $$Keyboard behavior is largely a manual check — focus order, visible focus, no traps, and that every control can be reached and activated.$$),

('WAS', 'Identify Web Accessibility Issues',
 $$Testing a site in Windows High Contrast Mode (Forced Colors) helps catch:$$,
 $$[
   {"key":"A","text":"Content and controls that disappear because they rely on background images, CSS-only icons, or hard-coded colors"},
   {"key":"B","text":"Missing alt text"},
   {"key":"C","text":"Keyboard traps"},
   {"key":"D","text":"Incorrect heading levels"}
 ]$$::jsonb,
 'A',
 $$Forced Colors overrides author colors; problems show up when meaning was carried by color/image alone (1.4.1, 1.4.11).$$),

('WAS', 'Identify Web Accessibility Issues',
 $$SC 1.4.10 Reflow requires content to be usable without two-dimensional scrolling at:$$,
 $$[
   {"key":"A","text":"200% zoom"},
   {"key":"B","text":"320 CSS px width (and 256 CSS px height for horizontal content) / equivalent to 400% zoom at 1280 px"},
   {"key":"C","text":"A fixed 1024 px viewport"},
   {"key":"D","text":"500% zoom"}
 ]$$::jsonb,
 'B',
 $$Reflow allows exceptions for content genuinely requiring 2D layout (maps, complex tables, diagrams).$$),

('WAS', 'Identify Web Accessibility Issues',
 $$SC 1.4.11 Non-text Contrast requires what minimum ratio for UI components and graphical objects against adjacent colors?$$,
 $$[
   {"key":"A","text":"3:1"},
   {"key":"B","text":"4.5:1"},
   {"key":"C","text":"7:1"},
   {"key":"D","text":"1.5:1"}
 ]$$::jsonb,
 'A',
 $$3:1 for UI components (borders, focus rings) and parts of graphics essential to understanding.$$),

('WAS', 'Identify Web Accessibility Issues',
 $$SC 4.1.3 Status Messages requires that certain messages:$$,
 $$[
   {"key":"A","text":"Be visible only"},
   {"key":"B","text":"Be programmatically determinable through role or properties so AT can announce them without a focus change"},
   {"key":"C","text":"Be announced with assertive live regions always"},
   {"key":"D","text":"Only appear in dialogs"}
 ]$$::jsonb,
 'B',
 $$Success/error/progress messages need role=\"status\" / \"alert\" or live regions, so AT users hear them without having to move focus.$$),

('WAS', 'Identify Web Accessibility Issues',
 $$A focus indicator that is only 1 px and low contrast may fail:$$,
 $$[
   {"key":"A","text":"1.1.1 Non-text Content"},
   {"key":"B","text":"2.4.7 Focus Visible (and 2.4.11 Focus Appearance in 2.2 draft)"},
   {"key":"C","text":"3.3.1 Error Identification"},
   {"key":"D","text":"4.1.2 Name, Role, Value"}
 ]$$::jsonb,
 'B',
 $$SC 2.4.7 requires a visible keyboard focus indicator. WCAG 2.2 added stronger focus-appearance requirements (2.4.11 Focus Not Obscured, 2.4.13 Focus Appearance at AAA).$$),

('WAS', 'Identify Web Accessibility Issues',
 $$When a focusable element has aria-hidden="true", this is:$$,
 $$[
   {"key":"A","text":"Perfectly valid"},
   {"key":"B","text":"An issue — focusable content must not be hidden from the accessibility tree"},
   {"key":"C","text":"Required by WCAG"},
   {"key":"D","text":"Only a problem in Firefox"}
 ]$$::jsonb,
 'B',
 $$Hiding a focusable element from AT creates "ghost focus" — keyboard users land on something screen readers cannot see.$$),

('WAS', 'Identify Web Accessibility Issues',
 $$An image''s alt text that duplicates nearby visible text (e.g., a photo of a person with alt="photo of a person" beside a caption with the same words) is:$$,
 $$[
   {"key":"A","text":"Always correct"},
   {"key":"B","text":"Redundant — leads to duplicate announcements for screen reader users; often the alt should be empty or reworded"},
   {"key":"C","text":"Required by SEO"},
   {"key":"D","text":"A violation of 2.4.7"}
 ]$$::jsonb,
 'B',
 $$Decorative or already-described images should use alt="" (or the alt should add new information, not duplicate captions).$$),

('WAS', 'Identify Web Accessibility Issues',
 $$SC 2.5.8 Target Size (Minimum), new in WCAG 2.2, requires:$$,
 $$[
   {"key":"A","text":"Targets at least 24×24 CSS pixels, with defined exceptions"},
   {"key":"B","text":"Targets at least 44×44 CSS pixels, with no exceptions"},
   {"key":"C","text":"Targets at least 100×100 px"},
   {"key":"D","text":"Targets at least 10×10 px"}
 ]$$::jsonb,
 'A',
 $$24×24 CSS px is the 2.2 AA minimum. 44×44 is the stricter AAA Target Size (Enhanced) requirement from earlier versions.$$),

('WAS', 'Identify Web Accessibility Issues',
 $$If a visible button reads "Search" but its accessible name is "Submit query," this may fail:$$,
 $$[
   {"key":"A","text":"2.5.3 Label in Name"},
   {"key":"B","text":"1.1.1 Non-text Content"},
   {"key":"C","text":"1.4.3 Contrast"},
   {"key":"D","text":"4.1.1 Parsing"}
 ]$$::jsonb,
 'A',
 $$SC 2.5.3 requires the accessible name to contain the visible label text so voice-control users can say what they see.$$),

('WAS', 'Identify Web Accessibility Issues',
 $$Orientation locking (forcing portrait or landscape) fails WCAG unless:$$,
 $$[
   {"key":"A","text":"It is on a mobile device"},
   {"key":"B","text":"A particular display orientation is essential (SC 1.3.4 Orientation)"},
   {"key":"C","text":"The user opts in"},
   {"key":"D","text":"The page is less than 320 px wide"}
 ]$$::jsonb,
 'B',
 $$Users with mounted devices (e.g., wheelchairs) may be unable to rotate their device; lock only when orientation is truly essential (piano apps, check deposits).$$),

('WAS', 'Identify Web Accessibility Issues',
 $$Which task is best evaluated by a manual screen-reader walkthrough rather than automated tools?$$,
 $$[
   {"key":"A","text":"Checking that images have alt attributes"},
   {"key":"B","text":"Verifying that a custom combobox announces its role, state, and value changes meaningfully"},
   {"key":"C","text":"Detecting missing lang attribute on <html>"},
   {"key":"D","text":"Finding duplicate IDs"}
 ]$$::jsonb,
 'B',
 $$Automated tools can flag missing ARIA, but only a human listening to AT can judge whether the experience is usable and makes sense.$$),

('WAS', 'Identify Web Accessibility Issues',
 $$A common automated-tool false positive is:$$,
 $$[
   {"key":"A","text":"Color-contrast failures on text that is actually hidden off-screen or overlaid correctly"},
   {"key":"B","text":"Missing <html> element"},
   {"key":"C","text":"Duplicate <title> tags"},
   {"key":"D","text":"Invalid HTML"}
 ]$$::jsonb,
 'A',
 $$Tools can''t always see stacking/overlays/visibility contexts. Every flagged issue should be human-verified before being reported as a defect.$$),

('WAS', 'Identify Web Accessibility Issues',
 $$To evaluate SC 2.4.2 Page Titled, you check that:$$,
 $$[
   {"key":"A","text":"The <title> exists and clearly describes the topic or purpose of the page"},
   {"key":"B","text":"Every <h1> is unique"},
   {"key":"C","text":"The URL contains keywords"},
   {"key":"D","text":"meta description is filled in"}
 ]$$::jsonb,
 'A',
 $$Titles orient users (especially AT users and people with cognitive disabilities) when switching tabs or revisiting history.$$),

('WAS', 'Identify Web Accessibility Issues',
 $$A carousel that auto-advances and offers no pause control is most likely to fail:$$,
 $$[
   {"key":"A","text":"1.4.3 Contrast"},
   {"key":"B","text":"2.2.2 Pause, Stop, Hide"},
   {"key":"C","text":"4.1.1 Parsing"},
   {"key":"D","text":"1.3.1 Info and Relationships"}
 ]$$::jsonb,
 'B',
 $$Any moving/auto-updating content lasting more than 5 seconds must be pausable, stoppable, or hideable.$$),

-- D3: Remediate Web Accessibility Issues
('WAS', 'Remediate Web Accessibility Issues',
 $$A <div class="nav"> containing primary site links should be remediated to:$$,
 $$[
   {"key":"A","text":"Keep as <div> with role=\"navigation\""},
   {"key":"B","text":"A <nav> element (and an aria-label if there are multiple <nav>s)"},
   {"key":"C","text":"Wrap in <section>"},
   {"key":"D","text":"No change needed"}
 ]$$::jsonb,
 'B',
 $$Native <nav> provides the navigation landmark; use ARIA only when native HTML cannot express the structure.$$),

('WAS', 'Remediate Web Accessibility Issues',
 $$A page has headings jumping from <h1> to <h4>. The correct fix is:$$,
 $$[
   {"key":"A","text":"Use CSS to visually re-order them"},
   {"key":"B","text":"Adjust the heading levels so the hierarchy is logical (h1 → h2 → h3) regardless of visual styling"},
   {"key":"C","text":"Replace all headings with <p>"},
   {"key":"D","text":"Add aria-level to the <h4>"}
 ]$$::jsonb,
 'B',
 $$Style and structure are independent. Pick the right heading level for meaning and style it to look however you need.$$),

('WAS', 'Remediate Web Accessibility Issues',
 $$A button''s default browser focus ring was removed via outline:none. The correct remediation is:$$,
 $$[
   {"key":"A","text":"Leave outline:none — the page is prettier"},
   {"key":"B","text":"Provide a clearly visible custom focus style (:focus-visible) meeting contrast requirements"},
   {"key":"C","text":"Add onclick=\"alert(''focused'')\""},
   {"key":"D","text":"Hide the button when not focused"}
 ]$$::jsonb,
 'B',
 $$Removing focus indicators without replacement fails 2.4.7. Use :focus-visible for a keyboard-only indicator that doesn''t show on mouse click.$$),

('WAS', 'Remediate Web Accessibility Issues',
 $$A skip link goes to #main but focus doesn''t actually move there when clicked. A common fix is:$$,
 $$[
   {"key":"A","text":"Add tabindex=\"-1\" to the target so it can receive programmatic focus, and ensure the script moves focus on activation if needed"},
   {"key":"B","text":"Replace the link with a button"},
   {"key":"C","text":"Remove the skip link"},
   {"key":"D","text":"Add aria-hidden=\"true\" to #main"}
 ]$$::jsonb,
 'A',
 $$Non-focusable targets (<main>, sections) need tabindex=\"-1\" to accept programmatic focus from fragment navigation.$$),

('WAS', 'Remediate Web Accessibility Issues',
 $$A form field uses only a placeholder ("Email") as its label. Remediate by:$$,
 $$[
   {"key":"A","text":"Adding a real <label> associated with the input (and keeping placeholder only for example text)"},
   {"key":"B","text":"Adding a title attribute"},
   {"key":"C","text":"Increasing placeholder contrast"},
   {"key":"D","text":"Nothing — placeholders are labels"}
 ]$$::jsonb,
 'A',
 $$Placeholders disappear on input, fail contrast, and aren''t always read by AT. A real persistent <label> is required.$$),

('WAS', 'Remediate Web Accessibility Issues',
 $$A decorative icon rendered inline as an <svg> should typically:$$,
 $$[
   {"key":"A","text":"Get role=\"img\" and an aria-label"},
   {"key":"B","text":"Have aria-hidden=\"true\" so AT does not announce it"},
   {"key":"C","text":"Have alt=\"decorative\""},
   {"key":"D","text":"Be wrapped in a <figure>"}
 ]$$::jsonb,
 'B',
 $$Decorative SVG should be hidden from AT. Meaningful SVG needs role=\"img\" plus an accessible name.$$),

('WAS', 'Remediate Web Accessibility Issues',
 $$A meaningful <svg> (e.g., a status icon) should:$$,
 $$[
   {"key":"A","text":"Be given role=\"img\" and an accessible name (aria-label or <title>)"},
   {"key":"B","text":"Use aria-hidden=\"true\""},
   {"key":"C","text":"Rely on adjacent visible text only"},
   {"key":"D","text":"Have no attributes at all"}
 ]$$::jsonb,
 'A',
 $$If the SVG conveys information not otherwise present as text, provide a programmatic name just like any image.$$),

('WAS', 'Remediate Web Accessibility Issues',
 $$A page has tabindex="1", "2", "3" scattered across elements. The best remediation is to:$$,
 $$[
   {"key":"A","text":"Increment them so the order is clearer"},
   {"key":"B","text":"Remove all positive tabindex values and let DOM order drive focus order (fixing DOM order if needed)"},
   {"key":"C","text":"Replace them with tabindex=\"-1\""},
   {"key":"D","text":"Nothing — positive tabindex is a best practice"}
 ]$$::jsonb,
 'B',
 $$Positive tabindex creates unpredictable focus orders. Source-order tab order is almost always the right answer.$$),

('WAS', 'Remediate Web Accessibility Issues',
 $$After a Single-Page-App route change, focus is still on a stale element. The fix is to:$$,
 $$[
   {"key":"A","text":"Do nothing"},
   {"key":"B","text":"Move focus to the new main heading (or a focusable landmark) and announce the route change"},
   {"key":"C","text":"Reload the page"},
   {"key":"D","text":"Add aria-hidden=\"true\" to the previous view"}
 ]$$::jsonb,
 'B',
 $$SPA route changes are like new pages. Manage focus and consider an aria-live announcement so AT users notice the transition.$$),

('WAS', 'Remediate Web Accessibility Issues',
 $$A link reading "click here" should be remediated by:$$,
 $$[
   {"key":"A","text":"Replacing the link text with text that describes the destination, such as ''Download the 2025 annual report (PDF)''"},
   {"key":"B","text":"Making it bold"},
   {"key":"C","text":"Adding aria-label=\"click here\""},
   {"key":"D","text":"Wrapping it in a heading"}
 ]$$::jsonb,
 'A',
 $$SC 2.4.4 Link Purpose. Descriptive link text also helps sighted users scanning a page and benefits SEO.$$),

('WAS', 'Remediate Web Accessibility Issues',
 $$A form submits and a success message appears in a <div>. To make the message reliably announced by screen readers without moving focus, remediate by:$$,
 $$[
   {"key":"A","text":"Adding role=\"status\" (or aria-live=\"polite\") to the message container"},
   {"key":"B","text":"Using a modal dialog"},
   {"key":"C","text":"Adding tabindex=\"0\" and forcing focus"},
   {"key":"D","text":"Using alert()"}
 ]$$::jsonb,
 'A',
 $$role=\"status\" implies aria-live=\"polite\" and announces updates without interrupting the user''s current action.$$),

('WAS', 'Remediate Web Accessibility Issues',
 $$An error summary at the top of a form should:$$,
 $$[
   {"key":"A","text":"Have links or references to each invalid field, receive focus (or be announced) after submission, and use clear error text"},
   {"key":"B","text":"Be an alert() dialog"},
   {"key":"C","text":"Use only color to indicate errors"},
   {"key":"D","text":"Be hidden from screen readers"}
 ]$$::jsonb,
 'A',
 $$An accessible error pattern combines visible summary + aria-invalid on fields + aria-describedby to the per-field message + programmatic focus management.$$),

('WAS', 'Remediate Web Accessibility Issues',
 $$Two identically-named "Edit" links on the same page (for different rows) can be disambiguated accessibly by:$$,
 $$[
   {"key":"A","text":"Visually-hidden text (e.g., ''Edit <span class=\"sr-only\">John Smith''s profile</span>'') or aria-label"},
   {"key":"B","text":"Using the same text since it''s shorter"},
   {"key":"C","text":"Replacing with icons only"},
   {"key":"D","text":"Linking both to the same URL"}
 ]$$::jsonb,
 'A',
 $$SC 2.4.4 / 2.4.9 — link purpose should be determinable from the link text alone (or with programmatic context).$$),

('WAS', 'Remediate Web Accessibility Issues',
 $$A credit card field has no autocomplete attribute. Add:$$,
 $$[
   {"key":"A","text":"autocomplete=\"cc-number\" (and matching tokens for expiry/CVC/name)"},
   {"key":"B","text":"autocomplete=\"off\""},
   {"key":"C","text":"placeholder=\"credit card number\""},
   {"key":"D","text":"aria-label=\"credit card\""}
 ]$$::jsonb,
 'A',
 $$Standardized autocomplete tokens satisfy SC 1.3.5 Identify Input Purpose and let password managers / autofill help cognitive-disability users.$$),

('WAS', 'Remediate Web Accessibility Issues',
 $$role="alert" should be used:$$,
 $$[
   {"key":"A","text":"Routinely on every message"},
   {"key":"B","text":"Sparingly, for important, time-sensitive messages — it implies assertive and interrupts the screen reader"},
   {"key":"C","text":"Only on <h1>"},
   {"key":"D","text":"On decorative elements"}
 ]$$::jsonb,
 'B',
 $$Overusing role=\"alert\" is noisy and annoying. For non-urgent updates, prefer role=\"status\" (polite).$$);
