/*
Copyright (c) 2015, Apple Inc. All rights reserved.

Redistribution and use in source and binary forms, with or without modification,
are permitted provided that the following conditions are met:

1.  Redistributions of source code must retain the above copyright notice, this
list of conditions and the following disclaimer.

2.  Redistributions in binary form must reproduce the above copyright notice,
this list of conditions and the following disclaimer in the documentation and/or
other materials provided with the distribution.

3.  Neither the name of the copyright holder(s) nor the names of any contributors
may be used to endorse or promote products derived from this software without
specific prior written permission. No license is granted to the trademarks of
the copyright holders even if such marks are included in this software.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE
FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/

import ResearchKit

class ConsentDocument: ORKConsentDocument {
    // MARK: Properties
    
    let customSections:[(sectionType:ORKConsentSectionType,(summary:String,content:[AnyObject]))] = [
        /*let sectionTypes: [ORKConsentSectionType] = [
         .Overview,
         .DataGathering,
         .Privacy,
         .DataUse,
         .TimeCommitment,
         .StudySurvey,
         .StudyTasks,
         .Withdrawing
         ]*/
        (ORKConsentSectionType.Overview,
            ("Overview",
                [
                ""
                ]
            )
        ),
        (ORKConsentSectionType.DataGathering,
            ("DataGathering",
                [
                    ""
                ]
            )
        ),
        (ORKConsentSectionType.Privacy,
            ("Privacy",
                [
                    ""
                ]
            )
        ),
        (ORKConsentSectionType.DataUse,
            ("DataUse",
                [
                    ""
                ]
            )
        ),
        (ORKConsentSectionType.TimeCommitment,
            ("TimeCommitment",
                [
                    ""
                ]
            )
        ),
        (ORKConsentSectionType.StudySurvey,
            ("StudySurvey",
                [
                    ""
                ]
            )
        ),
        (ORKConsentSectionType.StudyTasks,
            ("StudyTasks",
                [
                    ""
                ]
            )
        ),
        (ORKConsentSectionType.Withdrawing,
            ("Withdrawing",
                [
                    ""
                ]
            )
        ),
        (ORKConsentSectionType.Custom,
            ("Bảng Đồng Thuận",
                [
                    "",
                    UIImage(named: "shake-hands")!
                ]
            )
        ),
        
    ]
    // MARK: Initialization
    
    override init() {
        super.init()
        
        title = NSLocalizedString("Tầm soát viêm gan B-C", comment: "")
        
        
        sections = customSections.map {
            sectionType, data in
            let section = ORKConsentSection(type: sectionType)
            section.summary = data.summary
            if sectionType == ORKConsentSectionType.Custom{
                section.title = "Bảng Đồng Thuận"
                section.customImage = data.content[1] as? UIImage
                section.contentURL = NSURL(string: "http://localhost:8888/ProjectResearch/api/consentDocument.html")
            }else{
                section.content = data.content[0] as? String
            }
            return section
        }
        

        let signature = ORKConsentSignature(forPersonWithTitle: "Signature", dateFormatString: "dd/MM/yyyy", identifier: "ConsentDocumentParticipantSignature")
        signature.requiresName = true
        signature.requiresSignatureImage = true
        addSignature(signature)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ORKConsentSectionType: CustomStringConvertible {

    public var description: String {
        switch self {
            case .Overview:
                return "Overview"
                
            case .DataGathering:
                return "DataGathering"
                
            case .Privacy:
                return "Privacy"
                
            case .DataUse:
                return "DataUse"
                
            case .TimeCommitment:
                return "TimeCommitment"
                
            case .StudySurvey:
                return "StudySurvey"
                
            case .StudyTasks:
                return "StudyTasks"
                
            case .Withdrawing:
                return "Withdrawing"
                
            case .Custom:
                return "Custom"
                
            case .OnlyInDocument:
                return "OnlyInDocument"
        }
    }
}