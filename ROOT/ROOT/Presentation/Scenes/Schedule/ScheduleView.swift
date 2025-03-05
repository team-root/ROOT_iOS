import SwiftUI

struct ScheduleView: View {
    @State private var clickAlertButton: Bool = false
    @State private var month: Date = Date()
    @State private var selectedDate: Date? = nil

    var body: some View {
        NavigationView {
            ZStack {
                Color.gray600
                    .ignoresSafeArea()
                NavigationLink(isActive: $clickAlertButton) {
                    AlertView()
                } label: {
                    EmptyView()
                }
                VStack {
                    VStack {
                        headerView
                            .padding(.horizontal, 10)
                        calendarGridView
                            .padding(.horizontal, 25)
                    }
                    .background(Color.gray550.ignoresSafeArea())
                    .cornerRadius(10)
                    .padding(.horizontal, 24)
                    .padding(.top, 35)
                    
                    eventListView
                    
                    Spacer()
                }
            }
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("마이페이지")
                        .rootFont(.body(.body1), color: .gray100)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        clickAlertButton = true
                        print("alert button")
                    }) {
                        Image("bell")
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar(clickAlertButton ? .hidden : .visible, for: .tabBar)
        }
        .accentColor(.blue)
    }

    // MARK: - 헤더 뷰
    private var headerView: some View {
        VStack {
            HStack {
                Button(action: { changeMonth(by: -1) }) {
                    Image("back")
                }

                Text(month, formatter: Self.dateFormatter)
                    .font(.system(size: 18, weight: .bold))
                    .foregroundColor(.white)

                Button(action: { changeMonth(by: 1) }) {
                    Image("right")
                }
            }
            .padding(.vertical, 21)
            
            HStack {
                ForEach(Self.weekdaySymbols, id: \.self) { symbol in
                    Text(symbol)
                        .frame(maxWidth: .infinity)
                        .rootFont(.body(.body1), color: .gray100)
                }
            }
            .padding(.bottom, 5)
        }
        .padding(.horizontal)
    }

    // MARK: - 캘린더 뷰
    private var calendarGridView: some View {
        let daysInMonth = numberOfDays(in: month)
        let firstWeekday = firstWeekdayOfMonth(in: month) - 1

        return VStack {
            LazyVGrid(columns: Array(repeating: GridItem(), count: 7)) {
                ForEach(0..<daysInMonth + firstWeekday, id: \.self) { index in
                    if index < firstWeekday {
                        Color.clear.frame(height: 40)
                    } else {
                        let date = getDate(for: index - firstWeekday)
                        let day = index - firstWeekday + 1
                        let isSelected = selectedDate == date
                        let hasEvent = hasEvent(on: date)
                        
                        VStack {
                            if date.isSameDate(date: Date()) {
                                Circle()
                                    .fill(Color.main100)
                                    .frame(width: 24, height: 24)
                                    .overlay(
                                        Text("\(day)")
                                            .rootFont(.body(.body4), color: .gray100)
                                    )
                            } else {
                                Text("\(day)")
                                    .rootFont(.body(.body4), color: .gray100)
                            }
                            
                            Circle()
                                .fill(hasEvent ? Color.main100: .clear)
                                .frame(width: 5, height: 5)
                            
                        }
                        .frame(width: 38, height: 37, alignment: .center)
                        .background(isSelected ? Color.gray.opacity(0.8) : Color.clear)
                        .cornerRadius(10)
                        .onTapGesture {
                            selectedDate = date
                        }
                    }
                }
            }
        }
        .padding(.bottom, 21)
    }

    // MARK: - 이벤트 리스트
    private var eventListView: some View {
        VStack(alignment: .leading) {
            if let selectedDate = selectedDate, let events = eventsForDate(selectedDate) {
                Text("\(formattedDate(selectedDate))")
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(.white)
                    .padding(.bottom, 5)

                ForEach(events, id: \.self) { event in
                    HStack {
                        Circle()
                            .fill(Color.blue)
                            .frame(width: 6, height: 6)
                        Text(event)
                            .foregroundColor(.white)
                            .font(.system(size: 14))
                    }
                }
            } else {
                Text("선택한 일정이 없습니다.")
                    .foregroundColor(.gray)
                    .font(.system(size: 14))
            }
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.gray.opacity(0.2))
        .cornerRadius(10)
        .padding(.horizontal)
    }

    // MARK: - 날짜 관련 유틸리티
    private func getDate(for day: Int) -> Date {
        Calendar.current.date(byAdding: .day, value: day, to: startOfMonth())!
    }

    private func startOfMonth() -> Date {
        Calendar.current.date(from: Calendar.current.dateComponents([.year, .month], from: month))!
    }

    private func numberOfDays(in date: Date) -> Int {
        Calendar.current.range(of: .day, in: .month, for: date)?.count ?? 0
    }

    private func firstWeekdayOfMonth(in date: Date) -> Int {
        Calendar.current.component(.weekday, from: startOfMonth())
    }

    private func changeMonth(by value: Int) {
        if let newMonth = Calendar.current.date(byAdding: .month, value: value, to: month) {
            month = newMonth
        }
    }

    private func formattedDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "M월 d일"
        return formatter.string(from: date)
    }

    private func hasEvent(on date: Date) -> Bool {
        eventsForDate(date) != nil
    }

    private func eventsForDate(_ date: Date) -> [String]? {
        let sampleEvents: [String: [String]] = [
            "2024-12-31": ["환경지킴이", "각 반 청소", "졸업식 정리 도우미"],
            "2024-12-25": ["크리스마스 행사"]
        ]
        let dateString = formattedDate(date)
        return sampleEvents[dateString]
    }
}
extension Date {
    private func startOfDay() -> Date {
        Calendar.current.startOfDay(for: self)
    }
    
    func isSameDate(date: Date) -> Bool {
        self.startOfDay() == date.startOfDay()
    }
}

// MARK: - Static 프로퍼티
extension ScheduleView {
    static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy년 M월"
        return formatter
    }()

    static let weekdaySymbols = ["일", "월", "화", "수", "목", "금", "토"]
}

#Preview {
    ScheduleView()
}
