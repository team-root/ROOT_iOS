import SwiftUI

struct Event: Identifiable, Hashable {
    let id = UUID()
    let title: String
    let startDate: Date
    let endDate: Date
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: Event, rhs: Event) -> Bool {
        lhs.id == rhs.id
    }
}

struct ScheduleView: View {
    @State private var clickAlertButton: Bool = false
    @State private var month: Date = Date()
    @State private var selectedDate: Date? = nil
    @State private var events: [Event] = []
    
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
        .onAppear {
            loadEvents()
        }
    }
    
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
                        let isSelected = selectedDate?.isSameDate(date: date) ?? false
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
                        .cornerRadius(5)
                        .onTapGesture {
                            selectedDate = date
                        }
                    }
                }
            }
        }
        .padding(.bottom, 21)
    }
    
    private var eventListView: some View {
        VStack(alignment: .leading, spacing: .zero) {
            if let selectedDate = selectedDate {
                let eventsForSelectedDate = eventsForDate(selectedDate)
                
                Text("\(formattedDate(selectedDate))")
                    .rootFont(.caption(.caption2), color: .gray300)
                    .padding(.top, 15)
                    .padding(.leading, 15)
                
                if !eventsForSelectedDate.isEmpty {
                    VStack(alignment: .leading, spacing: .zero) {
                        ForEach(eventsForSelectedDate, id: \.self) { event in
                            HStack(alignment: .center, spacing: .zero) {
                                Circle()
                                    .fill(Color.main100)
                                    .frame(width: 5, height: 5)
                                    .padding(.leading, 15)
                                
                                Text(event.title)
                                    .rootFont(.caption(.caption1), color: .gray100)
                                    .padding(.leading, 11)
                            }
                        }
                        .padding(.bottom, 20)
                    }
                    .padding(.top, 14)
                    
                } else {
                    Text("일정이 없습니다.")
                        .rootFont(.caption(.caption1), color: .gray300)
                        .padding(.top, 14)
                        .padding(.bottom, 20)
                        .padding(.leading, 15)
                }
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.gray550)
        .cornerRadius(10)
        .padding(.horizontal, 24)
    }
    
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
    
    private func formatDateRange(start: Date, end: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "M.d"
        
        if Calendar.current.isDate(start, inSameDayAs: end) {
            return formatter.string(from: start)
        } else {
            return "\(formatter.string(from: start)) - \(formatter.string(from: end))"
        }
    }
    
    private func hasEvent(on date: Date) -> Bool {
        !eventsForDate(date).isEmpty
    }
    
    private func eventsForDate(_ date: Date) -> [Event] {
        events.filter { event in
            let startDay = Calendar.current.startOfDay(for: event.startDate)
            let endDay = Calendar.current.startOfDay(for: event.endDate)
            let checkDay = Calendar.current.startOfDay(for: date)
            
            return checkDay >= startDay && checkDay <= endDay
        }
    }
    
    private func loadEvents() {
        fetchEventsFromBackend { fetchedEvents in
            self.events = fetchedEvents
        }
    }
    private func fetchEventsFromBackend(completion: @escaping ([Event]) -> Void) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        let sampleEvents: [Event] = [
            Event(
                title: "신입생 2차 전형 도우미",
                startDate: dateFormatter.date(from: "2025-03-10")!,
                endDate: dateFormatter.date(from: "2025-03-10")!
            ),
            Event(
                title: "각 반 청소",
                startDate: dateFormatter.date(from: "2025-03-15")!,
                endDate: dateFormatter.date(from: "2025-03-18")!
            ),
            Event(
                title: "바쁨",
                startDate: dateFormatter.date(from: "2025-03-05")!,
                endDate: dateFormatter.date(from: "2025-03-05")!
            ),
            Event(
                title: "봉사봉사봉사",
                startDate: dateFormatter.date(from: "2025-03-15")!,
                endDate: dateFormatter.date(from: "2025-03-22")!
            )
        ]
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            completion(sampleEvents)
        }
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
