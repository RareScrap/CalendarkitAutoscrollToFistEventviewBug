//
//  MyDayviewController.swift
//  TestDayviewWithSegmentedControl
//
//  Created by RareScrap on 10.11.2020.
//

import Foundation
import CalendarKit

// TODO: Этот проект - попытка разобраться почему автоскролл DayView не работает, если тот вложен
// в segmented controll при открытии сегмента с dayview.
// сейчас известно что если взять версию из pod'а - все будет работать. Но если взять мою версию
// с кастомными вьюхами - оно перестанет скролить при показе + появится странный скролл вверх за
// допустимой области скролла
// Я знаю лишь что это из-за того что сабвью не успевают позиционироваться к вызову автоскролла,
// но не знаю почему.

class MyDayviewController: UIViewController {
    
    @IBOutlet weak var dayView: DayView!
    
    open override func viewDidAppear(_ animated: Bool) {
      super.viewDidAppear(animated)
      dayView.scrollToFirstEventIfNeeded()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dayView.isHeaderViewVisible = false
        dayView.dataSource = self
        dayView.autoScrollToFirstEvent = true
        
        var style = CalendarStyle()
        style.timeline.eventGap = 10
        dayView.updateStyle(style)
        
        dayView.reloadData()
    }
}

// MARK: EventDataSource
extension MyDayviewController: EventDataSource {
    func eventsForDate(_ date: Date) -> [EventDescriptor] {
        var events = [Event]()
        let event = Event()
        event.startDate = Date(timeIntervalSince1970: date.timeIntervalSince1970 + Double(6000 * 5))
        event.endDate = Date(timeIntervalSince1970: event.startDate.timeIntervalSince1970 + Double(6000 * 60))
        events.append(event)
        return events
    }
}
